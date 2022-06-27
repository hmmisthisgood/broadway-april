import 'package:flutter/material.dart';

import '../utils/my_custom_painter.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Painter"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomPaint(
            painter: MyCustomPainter(),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.yellow.withOpacity(0.2),
            ),
          )
        ]),
      ),
    );
  }
}
/// CustomPainter   == painter class
/// CustomPaint === widget