import 'package:async_app/models/posts.dart';
import 'package:flutter/material.dart';

class PostsControl extends StatelessWidget {
  final Posts posts;

  PostsControl({@required this.posts});

  @override
  Widget build(BuildContext context) {
    var color = Colors.black.withOpacity(posts.isFetching ? 0.5 : 1);
    return posts.isFetching && posts.items.length==0
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: posts.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  posts.items[index],
                  style: TextStyle(color: color),
                ),
                leading: Icon(Icons.stop, color: color, size: 15),
              );
            },
          );
  }
}
