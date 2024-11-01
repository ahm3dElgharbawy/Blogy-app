import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/features/home/screens/home/widgets/time.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class CustomTimeAndCommentsRow extends StatelessWidget {
  const CustomTimeAndCommentsRow({super.key, required this.time, required this.commentsCount});
  final String time;
  final int commentsCount;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        CustomTimeWidget(timeInAgo: time),
        const SizedBox(width: CustomSizes.spaceBtwItems),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Iconsax.message, size: 16, color: AppColors.softGrey),
            const SizedBox(width: CustomSizes.spaceBtwItems / 2),
            Text(
              "$commentsCount comments",
              style: TextStyles.medium12.copyWith(color: AppColors.softGrey),
            ),
          ],
        ),
      ],
    );
  }
}
