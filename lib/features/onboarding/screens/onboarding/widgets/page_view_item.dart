import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class CustomOnboardingPageViewItem extends StatelessWidget {
  const CustomOnboardingPageViewItem({super.key, required this.image, required this.title, required this.description});
  final String image;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 250,
        ),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Text(title, style: TextStyles.semibold26),
        const SizedBox(height: CustomSizes.spaceBtwItems),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.defaultSpace * 2),
          child: Text(
            description,
            style: TextStyles.regular16.copyWith(color: AppColors.softDark),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
