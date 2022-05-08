import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final image =
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our cool app")),
      body: Container(
        padding: EdgeInsets.all(20),
        // decoration: BoxDecoration(color: Colors.grey),
        child: Container(
          margin: EdgeInsets.all(20),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            // shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.black),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: Offset(5, 5)),
            ],
            gradient: LinearGradient(
                colors: [Colors.blue, Colors.pink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Image.network(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
