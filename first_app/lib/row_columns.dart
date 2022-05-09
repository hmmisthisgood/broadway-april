import 'package:flutter/material.dart';

class RowAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;

    print(height);
    print(width);

    return Scaffold(
        appBar: AppBar(title: Text("Row and columns")),
        body: Container(
          width: height,
          height: width,
          // color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(width: double.infinity, color: Colors.green),
                ),

                Flexible(
                  child: Container(
                      height: 100, width: double.infinity, color: Colors.red),
                ),

                Expanded(
                  flex: 4,
                  child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.purple),
                ),

                // Container(
                //     height: 300, width: double.infinity, color: Colors.purple),
                // Container(
                //     height: 300, width: double.infinity, color: Colors.black),

                // Container(height: 40, width: 100, color: Colors.yellow),
              ],
            ),
          ),
        ));
  }
}
