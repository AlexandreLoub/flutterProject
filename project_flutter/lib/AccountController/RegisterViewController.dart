import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/Components/SplashScreenHeader.dart';
import 'package:project_flutter/Components/UserRegisterationForm.dart';

class RegisterViewController extends StatefulWidget {
  @override
  _RegisterViewControllerState createState() => _RegisterViewControllerState();
}

class _RegisterViewControllerState extends State<RegisterViewController> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Avatar(),
            splashScreenHeader()[0],
            splashScreenHeader()[1],
            splashScreenHeader()[2],

            createUserForm(false),

            InkWell(
              child: Text('Already got an account ?\nClick here to login',
                  textAlign: TextAlign.center,
                  style: basicTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )),
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => LoginViewController()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

final TextStyle basicTextStyle = TextStyle(
  fontFamily: 'Source Sans Pro',
  color: Colors.teal.shade100,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);