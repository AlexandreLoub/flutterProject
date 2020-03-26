import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:project_flutter/Components/AppStateRedux.dart';
import 'AppBarManager.dart';

Future<void> makePostRequest(String requestFor, String email, String password,
    BuildContext context) async {
  final String url = 'https://apitestforflutter.herokuapp.com/$requestFor';
  final Map<String, String> headers = <String, String>{
    'Content-type': 'application/json'
  };
  final String json = '{"email": "$email", "password": "$password"}';
  final Response response = await post(url, headers: headers, body: json);
  final int statusCode = response.statusCode;
  if (statusCode != 200) {
    print('Request Failed with status $statusCode');
    return;
  }
  final Map<String, dynamic> map = jsonDecode(response.body);
  final User user = User(map['email'], map['profilePic']);
  print('UserInfos .email=[${user.email}] .image=[${user.image}]');
  try {
    StoreProvider.of<AppState>(context).dispatch(UserImageURL(user.image));
  } catch (e) {
    print(e);
    return;
  }

  Navigator.push<dynamic>(
    context,
    MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => AppBarManager()),
  );
}
