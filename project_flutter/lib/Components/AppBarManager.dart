
import 'package:flutter/material.dart';
import 'package:project_flutter/GalleryController/GalleryViewController.dart';
import 'package:project_flutter/ProfileController/ProfileViewController.dart';

class AppBarManager extends StatefulWidget {
  @override
  _AppBarManagerState createState() => _AppBarManagerState();
}

class _AppBarManagerState extends State<AppBarManager> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    GalleryViewController(),
    ProfileViewController(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyGalleryApp'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            title: const Text('Gallery'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: const Text('Profile'))
        ],
      ),
    );
  }
}
