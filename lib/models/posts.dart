import 'package:meta/meta.dart';

@immutable
class Posts {
  final List<String> items;
  final bool isFetching;
  final DateTime? lastUpdated;

  const Posts({required this.items, required this.isFetching, required this.lastUpdated});

  factory Posts.initial() {
    return Posts(items: [], isFetching: false, lastUpdated: null);
  }

  Posts copyWith({List<String>? items, bool? isFetching, bool? isRefreshing, DateTime? lastUpdated}) {
    return Posts(
        items: items ?? this.items,
        isFetching: isFetching ?? this.isFetching,
        lastUpdated: lastUpdated ?? this.lastUpdated);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Posts &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          isFetching == other.isFetching &&
          lastUpdated == other.lastUpdated;

  @override
  int get hashCode => items.hashCode ^ isFetching.hashCode ^ lastUpdated.hashCode;
}
