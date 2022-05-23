import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.pageController})
      : super(key: key);

  final PageController pageController;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int ourCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    print("bottom nav bar : build called");

    return BottomNavigationBar(
      onTap: (index) {
        ourCurrentIndex = index;
        print("current index: $ourCurrentIndex");
        setState(() {});

        widget.pageController.jumpToPage(
          index,
          // duration: Duration(milliseconds: 2000),
          // curve: Curves.ease,
        );
      },
      currentIndex: ourCurrentIndex,
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: "Inbox"),
      ],
    );
  }
}
