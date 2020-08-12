import 'dart:convert';
import 'package:async_app/actions/index.dart';
import 'package:async_app/models/posts.dart';
import 'package:async_app/models/postsByReddit.dart';
import 'package:async_app/reducers/selectors.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:http/http.dart' as http;

rootSaga() sync* {
  yield Fork(startup);
  yield Fork(nextRedditChange);
  yield Fork(invalidateReddit);
}

startup() sync* {
  var selectedReddit = Result<String>();
  yield Select(selector: selectedRedditSelector, result: selectedReddit);
  yield Fork(fetchPosts, args: [selectedReddit.value]);
}

nextRedditChange() sync* {
  while (true) {
    var prevReddit = Result<String>();
    yield Select(selector: selectedRedditSelector, result: prevReddit);

    yield Take(pattern: SelectReddit);

    var newReddit = Result<String>();
    yield Select(selector: selectedRedditSelector, result: newReddit);

    var postsByReddit = Result<PostsByReddit>();
    yield Select(selector: postsByRedditSelector, result: postsByReddit);

    if (!identical(prevReddit.value, newReddit.value)) {
      if (postsByReddit.value.items[newReddit.value] == null) {
        yield Fork(fetchPosts, args: [newReddit.value]);
      } else {
        yield Put(ReceivePosts(newReddit.value, postsByReddit.value.items[newReddit.value]));
      }
    }
  }
}

invalidateReddit() sync* {
  while (true) {
    var reddit = Result<InvalidateReddit>();
    yield Take(pattern: InvalidateReddit, result: reddit);
    yield Call(fetchPosts, args: [reddit.value.reddit]);
  }
}

fetchPosts(String reddit) sync* {
  yield Put(RequestPosts(reddit));
  var posts = Result<List<String>>();
  yield Call(fetchPostsApi, args: [reddit], result: posts);
  yield Put(ReceivePosts(
      reddit, Posts(items: posts.value, isFetching: false, lastUpdated: DateTime.now())));
}

fetchPostsApi(String reddit) async {
  return jsonDecode((await http.get('https://www.reddit.com/r/$reddit.json')).body)['data']
          ['children']
      .map<String>((v) => v['data']['title'] as String)
      .toList();
}
