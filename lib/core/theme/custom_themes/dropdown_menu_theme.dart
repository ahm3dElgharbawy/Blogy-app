import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

abstract class CustomDropdownMenuTheme {
  static DropdownMenuThemeData lightDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: CustomSizes.md,
        vertical: CustomSizes.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    textStyle: TextStyles.regular14,
    menuStyle: MenuStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
