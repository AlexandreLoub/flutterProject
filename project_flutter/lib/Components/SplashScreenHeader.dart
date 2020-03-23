import 'package:flutter/material.dart';

List<Widget> splashScreenHeader() {

  return <Widget>[Text(
    'My Beatiful Gallery',
    style: TextStyle(
      color: Colors.white,
      fontSize: 35,
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
    )];
}
