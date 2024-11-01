import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';

class CustomEmptyListWidget extends StatelessWidget {
  const CustomEmptyListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
    this.buttonText,
  });
  final String title;
  final String subtitle;
  final String image;
  final String? buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(height: CustomSizes.spaceBtwSections),
            Text(title, style: TextStyles.semibold26,textAlign: TextAlign.center),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(subtitle, style: TextStyles.medium14),
            const SizedBox(height: CustomSizes.spaceBtwSections),
            CustomElevatedButton(
              title: buttonText ?? "Continue Shopping".tr,
              onTap: onTap,
              width: 280,
            )
          ],
        ),
      ),
    );
  }
}
