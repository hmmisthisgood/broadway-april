import 'package:flutter/material.dart';

class ValueListenScreen extends StatelessWidget {
  ValueListenScreen({Key? key}) : super(key: key);

  int currentInde = 0;

  changeValue() {
    currentInde = 9;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: []),
    );
  }
}
