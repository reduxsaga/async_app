import 'package:async_app/config/configureStore.dart';
import 'package:async_app/containers/footer_container.dart';
import 'package:async_app/models/appState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'config/configureStore.dart';
import 'containers/picker_container.dart';
import 'containers/posts_container.dart';
import 'models/appState.dart';

void main() {
  runApp(MyApp(store: configureStore()));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store}) : super();

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Redux Saga Async Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Async Demo'),
              actions: <Widget>[
                Container(),
                PickerContainer(),
              ],
            ),
            body: PostsContainer(),
            bottomNavigationBar: FooterContainer(),
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
