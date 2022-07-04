import 'package:flutter/material.dart';

import '../../../../common/constant/assets.dart';

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.splashIcon,
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 0.8,
              color: Colors.blue,
            ),
            // LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}
