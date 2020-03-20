import 'package:flutter/material.dart';
import 'package:project_flutter/pictureView.dart';

const List<String> kAssets = ['koala.jpg', 'koala2.png'];

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _clickState = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AssetImage(
        'assets/${kAssets[_clickState ? 1 : 0]}',
      ),
      backgroundColor: Colors.transparent,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),
          );
          setState(() {
            _clickState = !_clickState;
          });
        },
      ),
    );
  }
}
