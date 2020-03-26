import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../main.dart';
import 'AppBarManager.dart';
import 'CustomTextStyles.dart';
import 'PostRequestManager.dart';
import 'TextFieldDelegate.dart';

Widget createUserForm(bool loginForm, BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          myTextFormField('Email', false, emailController),
          myTextFormField('Password', true, passwordController),
    StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) { return Padding(
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
                    try {
                      StoreProvider.of<AppState>(context)
                          .dispatch(UserEmail(emailController.text));
                    } catch (e) {
                      print(e);
                    }
                    loginForm
                        ? makePostRequest('login', emailController.text,
                            passwordController.text, context)
                        : makePostRequest('register', emailController.text,
                            passwordController.text, context);
                  }


                },
              ),
            ),
          );}
    )],
      ));
}
