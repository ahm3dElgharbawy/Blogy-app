import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({super.key, this.title = "Please wait"});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Row(
          children: [
            const SizedBox(
              height: 25,
              child: FittedBox(
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Text(title,style: TextStyles.regular14)
          ],
        ),
      ),
    );
  }
}
