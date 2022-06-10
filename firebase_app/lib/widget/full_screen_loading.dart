import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: Colors.black38,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          color: Colors.white,
          height: 60,
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: CircularProgressIndicator(
                // strokeWidth: 0.8,
                ),
          ),
        ),
      )),
    );
  }
}
