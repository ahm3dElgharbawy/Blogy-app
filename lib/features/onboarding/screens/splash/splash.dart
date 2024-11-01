import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/navigation/extensions.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:blog_app/features/layout/screens/app_layout.dart';
import 'package:blog_app/features/onboarding/screens/onboarding/onboarding.dart';
import 'package:blog_app/features/pin/screens/check/pin_check.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/images_strings.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(const Duration(seconds: 3));
    String? value = await CacheHelper.getString(kInitialScreenIndex);
    late Widget initScreen;
    switch (value) {
      case "1":
        initScreen = const LoginScreen();
        break;
      case "2":
        initScreen = await checkPin();
      default:
        initScreen = const OnboardingScreen();
    }
    if (mounted) {
      context.pushReplacementAll(initScreen);
    }
  }

  Future<Widget> checkPin() async {
    if (await CacheHelper.getString(kPin) != null) {
      return const PinCheckScreen();
    } else {
      return const AppLayoutScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffefefe),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Image.asset(
        ImagesStrings.logoPng,
        height: 120,
      ),
    );
  }
}
