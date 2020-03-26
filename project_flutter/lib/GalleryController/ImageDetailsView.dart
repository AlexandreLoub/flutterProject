import 'dart:io';
import 'package:flutter/material.dart';

class ImageDetailsView extends StatelessWidget {
  const ImageDetailsView({Key key, @required this.picture}) : super(key: key);
  final File picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Picture'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: true,
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.file(
              picture,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}