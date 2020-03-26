import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'Components/Redux/AppStateRedux.dart';

void main() {
  final AppState _initialState = AppState(imageList: <File>[]);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  const MyApp({this.store});
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: LoginViewController()),
    );
  }
}
