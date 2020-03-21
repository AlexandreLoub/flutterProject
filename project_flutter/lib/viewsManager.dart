import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_flutter/splashscreen.dart';
import 'package:project_flutter/pictureView.dart';
import 'package:project_flutter/profileView.dart';
import 'package:project_flutter/gridView.dart';
import 'dart:io';
import 'gridView.dart';

class viewsManager extends StatefulWidget {
  @override
  _viewsManagerState createState() => _viewsManagerState();
}

class _viewsManagerState extends State<viewsManager> {
  @override

  int _currentIndex = 0;
  final List<Widget> _children = [
    SecondRoute(),
    GridTest(),
    profileView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
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
              icon: Icon(Icons.add_to_photos),
              title: Text('GridTEST')
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

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SecondRoute(),
    SplashScreen(),
  ];

  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoice(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Make Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _runImageView() {
    if (imageFile == null) {
      return Text("Pas d'image selectionnée");
    } else {
      return Image.file(imageFile, width: 400, height: 400);
    }
  }

  Widget ProfileView() {
    //TODO
    return Column(
      children: <Widget>[
        Text("Hi User"),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage("https://i.imgur.com/qlxHxqW.jpg"),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Gallery"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ProfileView(),
              _runImageView(),
              RaisedButton(
                onPressed: () {
                  _showChoice(context);
                },
                child: Text("Seletionner une image"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_a_photo),
            title: new Text('Gallery'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_photos), title: Text('GridTEST')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GridTest()),
        );
      }
      if (_currentIndex == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GridTest()),
        );
      }
      print(_currentIndex);
    });
  }
}
