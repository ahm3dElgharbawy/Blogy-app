import 'package:flutter/material.dart';

class BottomNavigationModel {
  final IconData icon;
  final IconData activeIcon;
  final Widget screen;

  BottomNavigationModel(
      {required this.icon, required this.activeIcon, required this.screen});
}
