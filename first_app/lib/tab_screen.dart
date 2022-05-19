import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() {
    return new _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  // TODO: implement initState
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.black.withOpacity(0.3),
              labelColor: Colors.blue,
              tabs: [
                // Text("Home"),
                // Text("Games"),
                // Text("Movies"),
                // Text("Trending"),
                // Text("Near you"),

                Icon(
                  Icons.home,
                  size: 35,
                ),
                Icon(
                  Icons.card_giftcard,
                  size: 35,
                ),
                Icon(
                  Icons.location_on,
                  size: 35,
                ),
                Icon(
                  Icons.delete,
                  size: 35,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Container(color: Colors.red),
                Container(color: Colors.pink),
                Container(color: Colors.purple),
                Container(color: Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
