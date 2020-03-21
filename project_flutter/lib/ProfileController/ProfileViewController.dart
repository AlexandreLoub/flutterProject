import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import '../Components/avatar.dart';

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
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://i.imgur.com/qlxHxqW.jpg"),
                //backgroundColor: Colors.transparent,
              ),
          Text(
            "zizi"
          ),
          FlatButton(
            onPressed: () {
              print("logout presed");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginViewController()),
              );
            },
            child: Text("Logout"),
          ),
        ]),
      ),
    );
  }
}

Widget ProfileView() {
  //TODO
  return Column(
    children: <Widget>[
      Text("Hi User"),
      CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage("https://i.imgur.com/qlxHxqW.jpg"),
        backgroundColor: Colors.transparent,
      ),
    ],
  );
}
