import 'package:boilerplate/feature/authentication/ui/screen/login_screen.dart';
import 'package:boilerplate/feature/authentication/ui/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/common/route/routes.dart';
import 'package:boilerplate/feature/onboard/ui/screen/onboard_page.dart';
import 'package:boilerplate/feature/onboard/ui/screen/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.root:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardPage());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
