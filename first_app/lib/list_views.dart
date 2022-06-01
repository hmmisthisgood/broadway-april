import 'package:first_app/utils/assets.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,

        children: [
          Text("This text will be cut out"),
          Icon(
            Icons.home,
            size: 40,
            color: Colors.red,
          ),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
          Image.asset(Assets.wall),
        ],
      ),
    );
  }
}
