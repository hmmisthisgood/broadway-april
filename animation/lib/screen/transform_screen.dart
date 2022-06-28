import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class TransformScreen extends StatelessWidget {
  const TransformScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transform Screen")),
      body: Column(children: [
        SizedBox(height: 100),
        Container(
          // color: Colors.green,
          child: Transform.rotate(
            angle: -pi / 4,
            child: Text(
              "Horizontal",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: 100),
        Container(
          color: Colors.green,
          child: Transform.scale(
              scale: 1,
              child: Icon(
                Icons.home,
                size: 40,
              )),
        ),
        Container(
          color: Colors.green,
          child: Transform.translate(
              offset: Offset(300, 0),
              child: Icon(
                Icons.home,
                size: 40,
              )),
        ),
        Transform(
          transform: Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
          child: Text("I am 1x"),
        )
      ]),
    );
  }
}


// [1  0  0 ]
// [0  1  0 ]
// [0  0  1 ]