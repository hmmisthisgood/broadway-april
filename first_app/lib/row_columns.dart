import 'package:flutter/material.dart';

class RowAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Row and columns")),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 300, width: double.infinity, color: Colors.green),
                Container(
                    height: 300, width: double.infinity, color: Colors.red),
                Container(
                    height: 300, width: double.infinity, color: Colors.purple),
                Container(
                    height: 300, width: double.infinity, color: Colors.black),

                // Container(height: 40, width: 100, color: Colors.yellow),
              ],
            ),
          ),
        ));
  }
}
