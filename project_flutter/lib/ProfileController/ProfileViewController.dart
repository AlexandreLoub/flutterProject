import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/Components/AppStateRedux.dart';

class ProfileViewController extends StatefulWidget {
  @override
  _ProfileViewControllerState createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
          converter: (Store<AppState> store) => store.state,
          builder: (BuildContext context, AppState state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('http://${state.imageURL.toString()}'),
                  ),
                  Text('${state.email.toString()}'),
                  FlatButton(
                    onPressed: () {
                      print('logout presed');
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                                LoginViewController()),
                      );
                    },
                    child: const Text('Logout'),
                  ),
                ]);
          }),
    );
  }
}

Widget profileView() {
  return Column(
    children: <Widget>[
      const Text('Hi User'),
      CircleAvatar(
        radius: 50,
        backgroundImage: const NetworkImage('https://i.imgur.com/qlxHxqW.jpg'),
        backgroundColor: Colors.transparent,
      ),
    ],
  );
}
