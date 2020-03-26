import 'dart:io';
import 'package:project_flutter/Components/Animations/PushAnimationManager.dart';
import 'package:project_flutter/Components/TextFieldsForms/CustomTextStyles.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/Components/Redux/AppStateRedux.dart';

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
            return Container(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'http://${state.imageURL.toString()}'),
                        ),
                      ),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                  'Welcome !\nYour email is ${state.email.toString()}',
                                  textAlign: TextAlign.center,
                                  style: basicTextStyle.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  )))),
                      Container(
                        margin: const EdgeInsets.all(4),
                        width: double.infinity,
                        height: 36,
                        child: FlatButton(
                          textColor: Colors.white,
                          color: Colors.black,
                          child: const Text('Logout'),
                          onPressed: () {
                            state.imageList = <File>[];
                            pushThisViewWithoutAnimate(context, LoginViewController());
                          },
                        ),
                      ),
                    ]));
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
