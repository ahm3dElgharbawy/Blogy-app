import 'package:blog_app/features/home/screens/home/home.dart';
import 'package:blog_app/features/search/screens/search/search.dart';
import 'package:blog_app/features/setting/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:blog_app/features/layout/data/models/bottom_navigation_model.dart';

class BottomNavigationData {
  static get get => [
    BottomNavigationModel(icon: Iconsax.home_1, activeIcon:Iconsax.home_11 ,screen: const HomeScreen()),
    BottomNavigationModel(icon: Iconsax.search_normal, activeIcon:Iconsax.search_normal,screen: const SearchScreen()),
    BottomNavigationModel(icon: Iconsax.heart, activeIcon: Iconsax.heart5 ,screen: const SizedBox()),
    BottomNavigationModel(icon: Iconsax.setting_2, activeIcon: Iconsax.setting_2,screen: const SettingsScreen()),
  ];
}