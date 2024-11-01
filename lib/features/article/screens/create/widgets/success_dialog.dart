import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 60,
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(title),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            CustomElevatedButton(
              title: "Back to Home",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
