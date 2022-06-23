import 'package:flutter/material.dart';

class CustomRoute extends PageRoute {
  CustomRoute(this.child);

  Widget child;
  @override
  Color? get barrierColor => Colors.green;

  @override
  String? get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final curver = Curves.ease;

    final tween = Tween(begin: Offset(-1, 0.0), end: Offset(0.0, 0.0))
        .chain(CurveTween(curve: curver));

    // 400 millisecond,  (x,y)
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  @override
  bool get maintainState => true;
  @override
  Duration get transitionDuration => Duration(milliseconds: 800);
}

Route bottomToTop(Widget child) {
  return PageRouteBuilder(
      pageBuilder: (context, anim, second) {
        return child;
      },
      transitionDuration: Duration(milliseconds: 3000),
      reverseTransitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (context, first, second, _) {
        final curver = Curves.ease;

        final tween = Tween(begin: Offset(0, -1.0), end: Offset.zero)
            .chain(CurveTween(curve: curver));

        // 400 millisecond,  (x,y)
        return SlideTransition(
          position: first.drive(tween),
          child: child,
        );
      });
}
