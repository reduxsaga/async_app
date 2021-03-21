import 'package:async_app/actions/index.dart';
import 'package:async_app/models/appState.dart';
import 'package:async_app/presentation/picker.dart';
import 'package:async_app/reducers/selectors.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PickerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (BuildContext context, vm) {
        return PickerControl(
          value: vm.value,
          options: ['flutter', 'dart', 'google', 'frontend'],
          onChange: vm.onChange,
          onRefresh: vm.onRefresh,
        );
      },
    );
  }
}

class _ViewModel {
  final String value;
  final Function(String) onChange;
  final VoidCallback onRefresh;

  _ViewModel({required this.value, required this.onChange, required this.onRefresh});

  static _ViewModel fromStore(Store<AppState> store) {
    var selectedReddit = selectedRedditSelector(store.state);
    return _ViewModel(
      value: selectedReddit,
      onChange: (String reddit) => store.dispatch(SelectReddit(reddit)),
      onRefresh: () => store.dispatch(InvalidateReddit(selectedReddit)),
    );
  }
}
