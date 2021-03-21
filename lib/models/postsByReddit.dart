import 'package:async_app/models/posts.dart';
import 'package:meta/meta.dart';

@immutable
class PostsByReddit {
  final Map<String, Posts> items;

  const PostsByReddit({required this.items});

  factory PostsByReddit.initial() {
    return PostsByReddit(items: Map<String, Posts>());
  }

  PostsByReddit copyWith({Map<String, Posts>? items}) {
    return PostsByReddit(items: items ?? this.items);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostsByReddit && runtimeType == other.runtimeType && items == other.items;

  @override
  int get hashCode => items.hashCode;
}
