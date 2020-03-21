import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class GalleryViewController extends StatefulWidget {
  @override
  _GalleryViewControllerState createState() => _GalleryViewControllerState();
}

class _GalleryViewControllerState extends State<GalleryViewController> {
  List<File> test;
  File imageFile;

  Future<void>_openGallery(BuildContext context) async {
    final File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
      test.add(picture);
      print(test);
    });
    Navigator.of(context).pop();
  }

  Future<void> _openCamera(BuildContext context) async {
    final File picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
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
            title: const Text('Make Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text('Gallery'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: const Text('Camera'),
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

//  Widget _runImageView() {
//    if (imageFile == null) {
//      return const Text("Pas d'image selectionnée");
//    } else {
//      return Image.file(imageFile, width: 400, height: 400);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0),
                    itemCount: test.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          child: Image.file(
                        test[index],
                        fit: BoxFit.fill,
                          ),
                        onTap: () {
                            print(index);
                        },
                      );
                    })
//                child: ListView.builder(
//                    itemCount: test.length,
//                    itemBuilder: (BuildContext context, int Index) {
//                      return Image.file(test[Index]);
//                    })
                ),
            Container(
              padding: const EdgeInsets.only(top: 4),
              width: double.infinity,

              height: 40,
              child: FlatButton(

                textColor: Colors.white,
                color: Colors.blueAccent,
                padding: const EdgeInsets.all(0),
                child: const Text('Take pictures'),
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
//}, child: Text('Seletionner une image'),
//),
//
//
//],
//),
