import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GalleryViewController extends StatefulWidget {
  @override
  _GalleryViewControllerState createState() => _GalleryViewControllerState();
}

class _GalleryViewControllerState extends State<GalleryViewController> {
  List<File> test = [];
  File imageFile;

  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
      test.add(picture);
      print(test);
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
      test.add(picture);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemCount: test.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.file(
                        test[index],
                        fit: BoxFit.fill,
                      );
                    })
//                child: ListView.builder(
//                    itemCount: test.length,
//                    itemBuilder: (BuildContext context, int Index) {
//                      return Image.file(test[Index]);
//                    })
                ),
            Container(
              padding: EdgeInsets.only(top: 4),
              width: double.infinity,

              height: 40,
              child: FlatButton(

                textColor: Colors.white,
                color: Colors.blueAccent,
                padding: EdgeInsets.all(0),
                child: Text('Take pictures'),
                onPressed: () {
                  _showChoice(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
//child: Center(
//child: Column(
////mainAxisAlignment: MainAxisAlignment.spaceAround,
//children: <Widget>[
//_runImageView(),
//ListView.builder(
//scrollDirection: Axis.vertical,
//itemCount: test.length,
//itemBuilder: (BuildContext context, int index)  {
//if (test != null) {
//return Image.file(test[index]);
//}
//return Flexible(child: new ListView(
//padding: new EdgeInsets.symmetric(vertical: 8.0),
//children: <Widget>[
//Text('zozo')
//],
//)
//);
//}
//),
//
//RaisedButton(onPressed: (){
//_showChoice(context);
//}, child: Text("Seletionner une image"),
//),
//
//
//],
//),
