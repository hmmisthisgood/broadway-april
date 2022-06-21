import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  const Hero2({Key? key}) : super(key: key);

  final image =
      "https://cdn.pixabay.com/photo/2022/06/12/20/18/flower-7258778_1280.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: "image-tag",
            child: Image.network(image,
                height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
