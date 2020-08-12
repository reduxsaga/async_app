import 'package:async_app/actions/index.dart';
import 'package:async_app/models/posts.dart';
import 'package:async_app/models/postsByReddit.dart';
import 'package:redux/redux.dart';

final postsByRedditReducer = combineReducers<PostsByReddit>([
  TypedReducer<PostsByReddit, RequestPosts>(_requestPostsByRedditReducer),
  TypedReducer<PostsByReddit, ReceivePosts>(_receivePostsByRedditReducer),
]);

PostsByReddit _requestPostsByRedditReducer(PostsByReddit state, RequestPosts action) {
  return state.copyWith(items: {
    ...state.items,
    action.reddit: Posts(
      items: [],
      isFetching: false,
      lastUpdated: null,
    )
  });
}

PostsByReddit _receivePostsByRedditReducer(PostsByReddit state, ReceivePosts action) {
  return state.copyWith(items: {
    ...state.items,
    action.reddit: action.posts,
  });
}
