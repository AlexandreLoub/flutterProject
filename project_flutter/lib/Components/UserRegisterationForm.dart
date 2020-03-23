import 'package:flutter/material.dart';
import 'CustomTextStyles.dart';
import 'PostRequestManager.dart';
import 'TextFieldDelegate.dart';

Widget createUserForm(bool loginForm) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          myTextFormField('Email', false, emailController),
          myTextFormField('Password', true, passwordController),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: ButtonTheme(
              minWidth: 200,
              height: 40,
              buttonColor: Colors.lightGreen,
              child: RaisedButton(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(loginForm ? 'Validate' : 'Create',
                    style: basicTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    )),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    loginForm
                        ? makePostRequest('login', emailController.text,
                            passwordController.text)
                        : makePostRequest('register', emailController.text,
                            passwordController.text);
                  }
                  return;

//                    Navigator.push<dynamic>(
//                      context,
//                      MaterialPageRoute<dynamic>(builder: (BuildContext context) => AppBarManager()),
//                    );
                },
              ),
            ),
          ),
        ],
      ));
}
