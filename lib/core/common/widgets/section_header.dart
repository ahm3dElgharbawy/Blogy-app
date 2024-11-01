import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomSectionHeaderWidget extends StatelessWidget {
  const CustomSectionHeaderWidget(
      {super.key,
      this.padding,
      required this.sectionTitle,
      this.moreText,
      this.onTapMore,
      this.showLeadingBox = false});
  final EdgeInsetsGeometry? padding;
  final String sectionTitle;
  final String? moreText;
  final VoidCallback? onTapMore;
  final bool showLeadingBox;

  @override
  Widget build(BuildContext context) {
    return showLeadingBox
        ? Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: Row(
              children: [
                const CustomRoundedContainer(
                  height: 50,
                  width: 25,
                  color: AppColors.primary,
                  radius: 8,
                ),
                const SizedBox(width: CustomSizes.spaceBtwItems),
                Text(
                  sectionTitle,
                  style: TextStyles.semibold14.copyWith(color: AppColors.softDark),
                )
              ],
            ),
          )
        : Padding(
            padding: padding ??
                const EdgeInsets.symmetric(
                    horizontal: CustomSizes.defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  sectionTitle,
                  style: TextStyles.medium20,
                ),
                if (moreText != null)
                  TextButton(
                    onPressed: onTapMore,
                    child: Row(
                      children: [
                        Text(
                          moreText!,
                          style: TextStyles.medium14
                              .copyWith(color: AppColors.secondary),
                        ),
                        const SizedBox(width: CustomSizes.spaceBtwItems / 2),
                        const Icon(Icons.arrow_forward_ios_rounded,size: CustomSizes.iconXs,color: AppColors.secondary)
                      ],
                    ),
                  )
              ],
            ),
          );
  }
}
