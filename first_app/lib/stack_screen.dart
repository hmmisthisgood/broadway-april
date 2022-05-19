import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackScreen extends StatefulWidget {
  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  // Icon = widget
  int ourCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            ourCurrentIndex = index;
            print("current index: $ourCurrentIndex");
            setState(() {});
          },
          currentIndex: ourCurrentIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Discover"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Inbox"),

            // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
            // BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Image.asset("assets/images/wall.jpg",
                  fit: BoxFit.cover, height: double.infinity),
              Container(color: Colors.green.withOpacity(0.3)),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: Colors.white,
                  height: 50,
                  width: 200,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 100,
                child: Container(
                  height: 450,
                  width: 80,
                  color: Colors.red,
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  height: 150,
                  width: 200,
                  color: Colors.purple,
                ),
              )
            ],
          ),
        ));
  }
}
