import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  PageController ourController = PageController(initialPage: 0);

  List colorsList = [
    Colors.blue,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.amber
  ];

  Widget buildPageViewWithBuilder() {
    return PageView.builder(
      itemCount: colorsList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: colorsList[index],
          child: Center(
              child: Text(
            "Page number ${index + 1}",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        );
      },
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: ourController,
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        print("page changed: $index");
      },
      children: [
        Container(
          color: Colors.green,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: MaterialButton(
              height: 50,
              color: Colors.white,
              onPressed: () {
                ourController.animateToPage(2,
                    duration: Duration(seconds: 2), curve: Curves.ease);
              },
              child: Text("Press me"),
            ),
          ),
        ),
        Container(color: Colors.red),
        Container(color: Colors.pink),
        Container(color: Colors.purple),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageViewWithBuilder(),
    );
  }
}


// MaterialButton 
// TextButton 

// InkWell 

// GestureDetector 
