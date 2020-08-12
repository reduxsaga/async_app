import 'package:async_app/models/posts.dart';

class SelectReddit {
  final String reddit;

  SelectReddit(this.reddit);
}

class InvalidateReddit {
  final String reddit;

  InvalidateReddit(this.reddit);
}

class RequestPosts {
  final String reddit;

  RequestPosts(this.reddit);
}

class ReceivePosts {
  final Posts posts;
  final String reddit;

  ReceivePosts(this.reddit, this.posts);
}
