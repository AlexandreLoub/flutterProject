import 'package:flutter/material.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/providertestd.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Counter>(
          create: (BuildContext context) => Counter(),
        child: LoginViewController(),
      ),
    );
  }
}
