import 'package:flutter/material.dart';

class CustomTheme {
  static const lightBgColor = Color(0xffFFFFED);
  static const darkBgColorPrimary = Color(0xff243447);
  static const darkBgSecondary = Color(0xff141d26);

  static const lightTextColor = Color(0xff1f1f1f);
  static const darkTextColor = Colors.white;

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBgColorPrimary,
    fontFamily: "Poppins",
    dividerColor: Colors.white,
    primarySwatch: Colors.purple,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: darkTextColor, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: darkTextColor, fontSize: 22, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: darkTextColor, fontSize: 20, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: darkTextColor, fontSize: 18, fontWeight: FontWeight.w500),
      headline5: TextStyle(color: darkTextColor, fontSize: 16),
      headline6: TextStyle(color: darkTextColor, fontSize: 14),
      button: TextStyle(
          color: darkTextColor, fontSize: 16, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: darkTextColor, fontSize: 12),
      bodyText2: TextStyle(color: darkTextColor, fontSize: 10),
    ),
  );

  static ThemeData lighTheme = ThemeData(
    scaffoldBackgroundColor: lightBgColor,
    fontFamily: "Poppins",
    dividerColor: Colors.black,
    primarySwatch: Colors.purple,
    textTheme: TextTheme(
      headline1: TextStyle(
          color: lightTextColor, fontSize: 24, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          color: lightTextColor, fontSize: 20, fontWeight: FontWeight.bold),
      headline4: TextStyle(
          color: lightTextColor, fontSize: 18, fontWeight: FontWeight.w500),
      headline5: TextStyle(color: lightTextColor, fontSize: 16),
      headline6: TextStyle(color: lightTextColor, fontSize: 14),
      button: TextStyle(
          color: lightTextColor, fontSize: 16, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(color: lightTextColor, fontSize: 12),
      bodyText2: TextStyle(color: lightTextColor, fontSize: 10),
    ),
  );
}

// h1, h2, h3, h4, h5, h6 ---, bodyText1 , bodyText2, 
// 10 , 12 , 14 , 16,    18, 20 , 22, 24