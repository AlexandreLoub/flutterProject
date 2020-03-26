import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/providertestd.dart';
import 'package:provider/provider.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class UserEmail {
  UserEmail(this.email);
  final String email;

}
class UserImageURL {
  UserImageURL(this.imageURL);
  final String imageURL;
}

AppState reducer(AppState prevState, dynamic action) {
  final AppState newState = AppState.fromAppState(prevState);
  if (action is UserEmail) {
    newState.email = action.email;
  } else if (action is UserImageURL) {
    newState.imageURL = action.imageURL;
  }
  return newState;
}

class AppState {
  AppState(
      {this.email = '', this.imageURL = ''});
  AppState.fromAppState(AppState another) {
    email = another.email;
    imageURL = another.imageURL;
  }
  String email;
  String imageURL;
}

void main() {
  final _initialState = AppState();
  final Store<AppState> _store =
  Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: _store));

}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: LoginViewController()
      ),
    );
  }
}

//void main() => runApp(MyApp());

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: LoginViewController(),
//      );
//  }
//}
