import 'package:custom_clippers/custom_clippers.dart';

/// CustomPaint = draws some shape
/// CustomPainter
/// Clipper = clips into a shape
/// CustomClipper

import 'package:flutter/material.dart';

class CustomClipperScreen extends StatelessWidget {
  const CustomClipperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clipper"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipPath(
          clipper: TicketPassClipper(),
          child: Container(
            color: Colors.green,
            height: 100,
            width: 200,
          ),
        ),
      ]),
    );
  }
}
