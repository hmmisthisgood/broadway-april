import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class AppEnv extends InheritedWidget {
  final String baseUrl;
  final String someCredntials;
  final String envMode;
  final Widget child;
  AppEnv(
      {required this.baseUrl,
      required this.someCredntials,
      required this.envMode,
      required this.child})
      : super(child: child);

  static AppEnv of(BuildContext context) {
    final data = context.dependOnInheritedWidgetOfExactType<AppEnv>();
    return data!;

    if (data != null) {
      return data;
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
