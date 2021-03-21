import 'package:async_app/models/appState.dart';
import 'package:async_app/presentation/footer.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FooterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return FooterControl(
          lastUpdated: vm.lastUpdated,
        );
      },
    );
  }
}

class _ViewModel {
  final DateTime? lastUpdated;

  _ViewModel({required this.lastUpdated});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      lastUpdated: store.state.posts.lastUpdated,
    );
  }
}
