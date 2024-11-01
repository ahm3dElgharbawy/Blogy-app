import 'package:blog_app/core/helpers/navigation/extensions.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  // Make this class private
  NavigationHelper._internal();

  // Global key for the Navigator
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static pop() {
    navigatorKey.currentState?.pop();
  }

  static Future push(Widget screen,{AxisDirection direction = AxisDirection.left}) async {
    navigatorKey.currentContext?.push(screen, direction: direction);
  }

  static Future pushNamed(String routeName, {Object? args}) async {
    await navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  static Future pushReplacement(Widget screen,{AxisDirection direction = AxisDirection.left}) async {
    await navigatorKey.currentContext?.pushReplacement(
      screen,
      direction: direction
    );
  }

  static Future pushReplacementNamed(String routeName, {Object? args}) async {
    await navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: args);
  }

  static Future pushReplacementAll(Widget screen,{AxisDirection direction = AxisDirection.left}) async {
    await navigatorKey.currentContext?.pushReplacementAll(
      screen,
      direction: direction
    );
  }

  static Future pushReplacementAllNamed(String routeName,
      {Object? args}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: args,
    );
  }
}
