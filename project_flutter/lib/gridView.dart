import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class GridTest extends StatefulWidget {
  @override
  _GridTestState createState() => _GridTestState();
}

class _GridTestState extends State<GridTest> {

  final list_item = ["https://imgur.com/t/funny/bea2xSx", "https://imgur.com/t/funny/bea2xSx", "https://imgur.com/t/funny/bea2xSx"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: list_item.length,
        scrollDirection: Axis.vertical,
          gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Hero(
              tag: 'random$index',
              child: Material(
                child: InkWell(
                  child: Image.network(list_item[index]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


