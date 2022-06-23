import 'package:animation/screen/hero2_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  final image =
      "https://cdn.pixabay.com/photo/2022/06/12/20/18/flower-7258778_1280.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:Text("Hero animation")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => Hero2()));
            },
            child: Hero(
              tag: "image-tag",
              child: Image.network(image,
                  height: 500, width: double.infinity, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
