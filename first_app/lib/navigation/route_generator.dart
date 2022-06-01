import 'package:first_app/navigation/routes.dart';
import 'package:first_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../list_view_with_builder.dart';
import '../screen/splash_screen.dart';

Route ourRouteGenerator(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case Routes.loginScreen:
      return MaterialPageRoute(builder: (_) => TextFieldScreen());
    case Routes.dashboardScreen:
      final args = settings.arguments as NavProps;

      return MaterialPageRoute(
          builder: (_) => ListWithBuilderScreen(
              username: args.email, phoneNumber: args.phone));
    default:
      return MaterialPageRoute(builder: (_) => SplashScreen());
  }
}
