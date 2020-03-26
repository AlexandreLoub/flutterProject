import 'package:flutter/material.dart';

String validatePassword(String value) {
  if (value.length <= 5)
    return 'Your password must contain at least 6 charaters';
  else
    return null;
}

String validateEmail(String value) {
  const Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'You should to enter valid email';
  else
    return null;
}

Widget myTextFormField(
    String title, bool hideText, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextFormField(
      validator: (String value) {
        return title == 'Email'
            ? validateEmail(value)
            : validatePassword(value);
      },
      style: TextStyle(color: Colors.white70),
      cursorColor: Colors.white,
      controller: controller,
      obscureText: hideText,
      decoration: InputDecoration(
        focusColor: Colors.white,
        border: const OutlineInputBorder(),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        disabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        errorBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        labelText: title,
        labelStyle: TextStyle(color: Colors.white70),
      ),
    ),
  );
}
