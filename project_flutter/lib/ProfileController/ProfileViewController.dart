import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';

class ProfileViewController extends StatefulWidget {
  @override
  _ProfileViewControllerState createState() => _ProfileViewControllerState();
}

class _ProfileViewControllerState extends State<ProfileViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://i.imgur.com/qlxHxqW.jpg'),
                //backgroundColor: Colors.transparent,
              ),
          const Text(
            'zizi'
          ),
          FlatButton(
            onPressed: () {
              print('logout presed');
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(builder: (BuildContext context) => LoginViewController()),
              );
            },
            child: const Text('Logout'),
          ),
        ]),
      ),
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
