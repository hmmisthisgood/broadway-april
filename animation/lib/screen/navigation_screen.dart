import 'package:animation/navigation/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import "hero1_screen.dart";
import "anim_container.dart";
import "homepage.dart";

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);

  final List<Map> pages = [
    {"name": "animated container", 'targetWidget': AnimContainerScreen()},
    {"name": "Hero screen", 'targetWidget': Hero1()},
    {"name": "Lottie", 'targetWidget': Homepage()}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Navigate")),
        body: ListView.builder(
            itemCount: pages.length,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final item = pages[index];

              return MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     CupertinoPageRoute(
                    //         builder: (_) => item['targetWidget']));

                    // Navigator.push(context, bottomToTop(item['targetWidget']));
                    Navigator.push(context, bottomToTop(item['targetWidget']));
                  },
                  color: Colors.purple,
                  child: Text(item["name"],
                      style: TextStyle(color: Colors.white)));
            }));
  }
}