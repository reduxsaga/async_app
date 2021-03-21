import 'package:async_app/models/posts.dart';
import 'package:async_app/models/postsByReddit.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final String selectedReddit;
  final Posts posts;
  final PostsByReddit postsByReddit;

  const AppState({
    required this.selectedReddit,
    required this.posts,
    required this.postsByReddit,
  });

  factory AppState.initial() {
    return AppState(
      selectedReddit: 'flutter',
      posts: Posts.initial(),
      postsByReddit: PostsByReddit.initial(),
    );
  }

  AppState copyWith({
    String? selectedReddit,
    Posts? posts,
    PostsByReddit? postsByReddit,
  }) {
    return AppState(
      selectedReddit: selectedReddit ?? this.selectedReddit,
      posts: posts ?? this.posts,
      postsByReddit: postsByReddit ?? this.postsByReddit,
    );
  }

  @override
  int get hashCode => selectedReddit.hashCode ^ posts.hashCode ^ postsByReddit.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          selectedReddit == other.selectedReddit &&
          posts == other.posts &&
          postsByReddit == other.postsByReddit;
}
