import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:flutter/material.dart';


class CustomSettingListTile extends StatelessWidget {
  const CustomSettingListTile({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.onTap,
    this.showTrailing = false,
    this.showLeading = true,
    this.trailing,
  });
  final String title;
  final IconData leadingIcon;
  final Widget? trailing;
  final bool showTrailing;
  final bool showLeading;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      animationDuration: const Duration(microseconds: 1),
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Row(
        children: [
          if(showLeading) Icon(leadingIcon),
          if(showLeading) const SizedBox(width: CustomSizes.spaceBtwItems),
          Text(title, style: TextStyles.regular14),
          if (showTrailing) const Spacer(),
          if (showTrailing)
            trailing ??
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: CustomSizes.iconSm,
                )
        ],
      ),
    );
  }
}
