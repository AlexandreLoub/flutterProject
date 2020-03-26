import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/RegisterViewController.dart';
import 'package:project_flutter/Components/SplashScreenHeader.dart';
import 'package:project_flutter/Components/UserRegisterationForm.dart';

class LoginViewController extends StatefulWidget {
  @override
  _LoginViewControllerState createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            splashScreenHeader()[0],
            splashScreenHeader()[1],
            splashScreenHeader()[2],
            createUserForm(true, context),
            InkWell(
              child: Text('Create Account Now',
                  style: basicTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )),
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          RegisterViewController()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
