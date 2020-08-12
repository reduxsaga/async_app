import 'package:async_app/actions/index.dart';
import 'package:async_app/models/posts.dart';
import 'package:redux/redux.dart';

final postsReducer = combineReducers<Posts>([
  TypedReducer<Posts, RequestPosts>(_requestPostsReducer),
  TypedReducer<Posts, ReceivePosts>(_receivePostsReducer),
]);

Posts _requestPostsReducer(Posts state, RequestPosts action) {
  return state.copyWith(
    isFetching: true,
  );
}

Posts _receivePostsReducer(Posts state, ReceivePosts action) {
  return action.posts;
}
