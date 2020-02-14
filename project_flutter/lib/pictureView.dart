import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();



}

class _SecondRouteState extends State<SecondRoute> {


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
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Make Choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery(context);
                  },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
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
    return Column (
      children: <Widget>[
        Text("Hi User"),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            "https://i.imgur.com/qlxHxqW.jpg"
          ),
        backgroundColor: Colors.transparent,
        ),
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ProfileView(),
              _runImageView(),
              RaisedButton(onPressed: (){
                _showChoice(context);
              }, child: Text("Seletionner une image"),
              ),



            ],
          ),
        ),

      ),
    );
  }
}
