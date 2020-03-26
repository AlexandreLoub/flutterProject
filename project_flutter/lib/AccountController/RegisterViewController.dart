import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/Components/TextFieldsForms/CustomTextStyles.dart';
import 'package:project_flutter/Components/TextFieldsForms/SplashScreenHeader.dart';
import 'package:project_flutter/Components/TextFieldsForms/UserRegisterationForm.dart';
import 'package:project_flutter/Components/Animations/PushAnimationManager.dart';

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
            splashScreenHeader()[0],
            splashScreenHeader()[1],
            splashScreenHeader()[2],
            createUserForm(false, context),
            InkWell(
              child: Text('Already got an account ?\nClick here to login',
                  textAlign: TextAlign.center,
                  style: basicTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )),
              onTap: () {
                pushThisViewWithoutAnimate(context, LoginViewController());
              },
            ),
          ],
        ),
      ),
    );
  }
}