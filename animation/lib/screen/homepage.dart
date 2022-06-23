import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Lottie animation")
      ),
      body: Column(children: [
        Lottie.asset("assets/animation/apple_animation.json"),
        Image.asset("assets/animation/applecut.gif")
      ]),
    );
  }
}
