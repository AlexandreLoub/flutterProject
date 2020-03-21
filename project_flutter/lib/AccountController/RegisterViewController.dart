import 'package:flutter/material.dart';
import 'package:project_flutter/Components/AppBarManager.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';

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
            Text(
              'My Beatiful Gallery',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              'STORE YOUR PICTURES',
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                color: Colors.teal.shade100,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),

            SizedBox.fromSize(
              size: Size(200, 40), // button width and height

              child: Material(
                color: Colors.lightGreen, // button color
                child: InkWell(
                  //splashColor: Colors.blueAccent, // splash color
                  onTap: () {
                    print("register request");
                  }, // button pressed
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // icon

                      Text('Create',
                          style: BasicTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )) // text
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              child: Text(
                  'Already got an account ?\nClick here to login',
                  textAlign: TextAlign.center,
                  style: BasicTextStyle.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  )),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginViewController()),
                );
              },
            ),


          ],
        ),
      ),
    );
  }
}

final BasicTextStyle = TextStyle(
  fontFamily: 'Source Sans Pro',
  color: Colors.teal.shade100,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);
