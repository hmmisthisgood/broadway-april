import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class GridViewScreen extends StatelessWidget {
  List<Item> items = [
    Item(color: Colors.green, icon: Icons.home, name: "home"),
    Item(color: Colors.red, icon: Icons.error, name: "error"),
    Item(color: Colors.blue, icon: Icons.map, name: "map"),
    Item(color: Colors.orange, icon: Icons.hotel, name: "hotel"),
    Item(color: Colors.yellow, icon: Icons.traffic, name: "traffic")
  ];

  List itemsMap = [
    {"color": Colors.green, "icon": Icons.h_mobiledata, "name": "Home"},
    {"color": Colors.green, "icon": Icons.h_mobiledata, "name": "Home"},
    {"color": Colors.green, "icon": Icons.h_mobiledata, "name": "Home"},
    {"color": Colors.green, "icon": Icons.h_mobiledata, "name": "Home"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: items.length, //
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            childAspectRatio: 1.1 // 1/3
            ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: items[index].color),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      items[index].icon,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(items[index].name), //names[2]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  String name;
  IconData icon;
  Color color;
  Item({required this.name, required this.icon, required this.color});
}
