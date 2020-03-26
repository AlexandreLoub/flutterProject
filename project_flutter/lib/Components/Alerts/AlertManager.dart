import 'package:flutter/material.dart';

void sendAlert(String description, BuildContext context) {
  showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
}
