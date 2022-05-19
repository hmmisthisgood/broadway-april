import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Images")),
      body: ListView(
        children: [
          Image.network(image),
          FadeInImage(
            placeholder: AssetImage("assets/images/placeholder.jpg"),
            image: NetworkImage(image),
            imageErrorBuilder: (context, a, b) {
              return Text("Image could not be loaded");
            },
          ),
          Image.asset("assets/images/wall.jpg"),
        ],
      ),
    );
  }
}
