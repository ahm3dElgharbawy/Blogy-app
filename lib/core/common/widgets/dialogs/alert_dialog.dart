import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/buttons/outlined_button.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.okText,
    this.okButtonColor = Colors.red,
    required this.onTapOk,
    this.isLoading = false
  });
  final String title;
  final String content;
  final String? okText;
  final Color okButtonColor;
  final VoidCallback onTapOk;
  final bool isLoading ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        bottom: CustomSizes.defaultSpace,
        right: CustomSizes.defaultSpace,
        left: CustomSizes.defaultSpace,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title, style: TextStyles.medium20),
      content: Text(
        content,
        style: TextStyles.regular16.copyWith(color: AppColors.darkTwo),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomOutlinedButton(
                title: "Cancel".tr,
                onTap: () {
                  NavigationHelper.pop();
                },
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(
              child: CustomElevatedButton(
                title: okText ?? "Delete".tr,
                onTap: onTapOk,
                color: okButtonColor,
                isLoading: isLoading,
              ),
            ),
          ],
        )
      ],
    );
  }
}
