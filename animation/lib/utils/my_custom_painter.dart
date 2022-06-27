import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round;
    // ..shader = ui.LinearGradient(colors: []);

    // canvas.clipRRect(RRect.fromLTRBAndCorners(100, 100, 100, 100,
    //     topLeft: Radius.circular(20)));

    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(100, 0);
    path.lineTo(100, 100);
    // path.lineTo(0, 100);
    // path.lineTo(0, 0);

    // path.quadraticBezierTo(30, 130, 100, 100);
    // path.quadraticBezierTo(175, 130, 200, 100);

    path.close();
    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(150, 100), 30, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


/// Canvas
/// Paint 
/// strokWidth/strokeCap 
/// Path


// 0= 0%
// 1 -100%