import 'package:first_app/image_screen.dart';
import 'package:first_app/widget/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'list_view_with_builder.dart';
import 'package:first_app/list_view_with_builder.dart';

class StackScreen extends StatefulWidget {
  @override
  State<StackScreen> createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen>
    with AutomaticKeepAliveClientMixin {
  // Icon = widget
  int ourCurrentIndex = 0;
  final pageController = PageController();

  Widget buildBody() {
    switch (ourCurrentIndex) {
      case 0:
        return buildStack();
      case 1:
        return ListWithBuilderScreen();
      case 2:
        return ImageScreen();
      default:
        return buildStack();
    }
  }

  buildStack() {
    return Stack(
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
    );
  }

  buildBodyWithPageView() {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [buildStack(), ListWithBuilderScreen(), ImageScreen()],
    );
  }

  @override
  Widget build(BuildContext context) {
    print("parent build called");
    return Scaffold(
        bottomNavigationBar: BottomNavBar(pageController: pageController),
        body: buildBodyWithPageView()

        //  buildBody(),
        );
  }

  @override
  bool get wantKeepAlive => true;
}
