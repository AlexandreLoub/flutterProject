import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:project_flutter/Components/Animations/PushAnimationManager.dart';
import 'package:project_flutter/GalleryController/ImageDetailsView.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_flutter/Components/Alerts/AlertManager.dart';
import 'package:project_flutter/Components/Redux/AppStateRedux.dart';

class GalleryViewController extends StatefulWidget {
  @override
  _GalleryViewControllerState createState() => _GalleryViewControllerState();
}

class _GalleryViewControllerState extends State<GalleryViewController> {
  Future<void> _openGallery(BuildContext context) async {
    final File picture =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    if (picture == null) return;
    setState(() {
      try {
        StoreProvider.of<AppState>(context).dispatch(UserImages(picture));
      } catch (e) {
        sendAlert(e, context);
        return;
      }
    });
    Navigator.of(context).pop();
  }

  Future<void> _openCamera(BuildContext context) async {
    final File picture =
        await ImagePicker.pickImage(source: ImageSource.camera);
    if (picture == null) return;
    setState(() {
      try {
        StoreProvider.of<AppState>(context).dispatch(UserImages(picture));
      } catch (e) {
        sendAlert(e, context);
        return;
      }
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: StoreConnector<AppState, AppState>(
              converter: (Store<AppState> store) => store.state,
              builder: (BuildContext context, AppState state) {
                return Container(
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          child: GridView.builder(
                              gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 4.0),
                              itemCount: state.imageList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  child: Image.file(
                                    state.imageList[index],
                                    fit: BoxFit.fill,
                                  ),
                                  onTap: () {
                                    print(index);
                                    Navigator.push<dynamic>(
                                        context,
                                        SizeRoute(
                                            page: ImageDetailsView(
                                                picture:
                                                state.imageList[index])));
                                  },
                                );
                              })),
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
                );
              })
      ),
      onWillPop: () {
        return Future(() => false);
      },
    );
  }
}
