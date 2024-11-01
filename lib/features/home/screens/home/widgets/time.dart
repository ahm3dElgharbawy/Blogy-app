import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class CustomTimeWidget extends StatelessWidget {
  const CustomTimeWidget({super.key, required this.timeInAgo});
  final String timeInAgo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Iconsax.clock, size: 16, color: AppColors.softGrey),
        const SizedBox(width: CustomSizes.spaceBtwItems / 2),
        Text(
          timeInAgo,
          style: TextStyles.medium12.copyWith(color: AppColors.softGrey),
        ),
      ],
    );
  }
}
