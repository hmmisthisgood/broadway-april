import 'package:animation/screen/anim_container.dart';
import 'package:animation/screen/hero1_screen.dart';
import 'package:flutter/material.dart';

import 'screen/homepage.dart';
import "screen/navigation_screen.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationScreen(),
    );
  }
}
