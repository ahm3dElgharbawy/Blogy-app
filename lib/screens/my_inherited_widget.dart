import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  int counter;
  @override
  MyInheritedWidget({
    super.key,
    required this.counter,
    required super.child,
  });
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}
