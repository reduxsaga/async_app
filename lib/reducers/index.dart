import 'package:async_app/models/appState.dart';
import 'package:async_app/reducers/postsByReddit_reducer.dart';
import 'package:async_app/reducers/posts_reducer.dart';
import 'package:async_app/reducers/selectedReddit_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      selectedReddit: selectRedditReducer(state.selectedReddit, action),
      posts: postsReducer(state.posts, action),
      postsByReddit: postsByRedditReducer(state.postsByReddit, action));
}
