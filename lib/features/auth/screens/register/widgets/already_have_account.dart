import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Already have an account? ",
            style: TextStyles.medium14,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                NavigationHelper.pushReplacement(
                  const LoginScreen(),
                );
              },
            text: "Login",
            style: TextStyles.semibold14.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
