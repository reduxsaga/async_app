import 'package:async_app/models/appState.dart';
import 'package:async_app/models/posts.dart';
import 'package:async_app/presentation/posts.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PostsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return PostsControl(
          posts: vm.posts,
        );
      },
    );
  }
}

class _ViewModel {
  final Posts posts;

  _ViewModel({@required this.posts});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(posts: store.state.posts);
  }
}
