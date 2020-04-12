import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/RegisterViewController.dart';
import 'package:project_flutter/Components/Animations/PushAnimationManager.dart';
import 'package:project_flutter/Components/TextFieldsForms/CustomTextStyles.dart';
import 'package:project_flutter/Components/TextFieldsForms/SplashScreenHeader.dart';
import 'package:project_flutter/Components/TextFieldsForms/UserRegisterationForm.dart';

class LoginViewController extends StatefulWidget {
  @override
  _LoginViewControllerState createState() => _LoginViewControllerState();
}

class _LoginViewControllerState extends State<LoginViewController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
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
                  pushThisViewWithoutAnimate(context, RegisterViewController());
                },
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {
        return Future<bool>(() => false);
      },
    );
  }
}
