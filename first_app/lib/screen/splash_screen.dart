import 'dart:async';

import 'package:first_app/login_screen.dart';
import 'package:first_app/utils/assets.dart';
import 'package:first_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedInStatus();
  }

  checkUserLoggedInStatus() async {
    final isLoggedIn = await SharedPref.getIsUserLoggedIn();
    final user = await SharedPref.getUser();
    Future.delayed(Duration(seconds: 2), () {
      if (isLoggedIn == false) {
        Navigator.pushNamed(context, Routes.loginScreen);
        return;
      }

      var _phone = "";
      var _email = "";
      if (user != null) {
        _email = user.email;
        _phone = user.profilePicture;
      }

      Navigator.pushNamed(context, Routes.dashboardScreen,
          arguments: NavProps(phone: _phone, email: _email));
    });
  }

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
