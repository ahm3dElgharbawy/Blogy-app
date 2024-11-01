import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';


class CustomRequiredTextSection extends StatelessWidget {
  const CustomRequiredTextSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(bottom: CustomSizes.sm),
      child: Row(
        children: [
          Text(title, style: TextStyles.semibold16.copyWith(color: AppColors.softDark)),
          Text(
            "*",
            style: TextStyles.semibold16.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
