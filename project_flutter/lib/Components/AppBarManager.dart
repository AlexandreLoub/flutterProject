import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_flutter/AccountController/LoginViewController.dart';
import 'package:project_flutter/GalleryController/GalleryViewController.dart';
import 'package:project_flutter/ProfileController/ProfileViewController.dart';
import 'package:project_flutter/GalleryController/gridView.dart';
import 'dart:io';
import '../GalleryController/gridView.dart';

class AppBarManager extends StatefulWidget {
  @override
  _AppBarManagerState createState() => _AppBarManagerState();
}

class _AppBarManagerState extends State<AppBarManager> {
  @override

  int _currentIndex = 0;
  final List<Widget> _children = [
    GalleryViewController(),
    ProfileViewController(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyGalleryApp'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),

      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_a_photo),
            title: new Text('Gallery'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }
}