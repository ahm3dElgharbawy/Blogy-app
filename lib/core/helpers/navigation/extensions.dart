// Extension on BuildContext
import 'package:flutter/material.dart';

extension SlideNavigation on BuildContext {
  void pop() {
    Navigator.pop(
      this,
    );
  }

  void push(Widget page, {AxisDirection direction = AxisDirection.left}) {
    Offset begin = getBegin(direction);
    var end = Offset.zero;

    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Future pushReplacement(Widget screen,
      {AxisDirection direction = AxisDirection.left}) {
    Offset begin = getBegin(direction);
    var end = Offset.zero;

    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return Navigator.pushReplacement(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Future pushReplacementAll(Widget screen,
      {AxisDirection direction = AxisDirection.left}) {
    Offset begin = getBegin(direction);
    var end = Offset.zero;

    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return Navigator.pushAndRemoveUntil(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
      (route) => false,
    );
  }
}

Offset getBegin(AxisDirection direction) {
  // Define the begin offset based on the direction
  final Offset begin;
  switch (direction) {
    case AxisDirection.up:
      begin = const Offset(0.0, 1.0);
      break;
    case AxisDirection.down:
      begin = const Offset(0.0, -1.0);
      break;
    case AxisDirection.left:
      begin = const Offset(1.0, 0.0);
      break;
    case AxisDirection.right:
    default:
      begin = const Offset(-1.0, 0.0);
      break;
  }
  return begin;
}
