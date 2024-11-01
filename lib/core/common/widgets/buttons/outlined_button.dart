import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:blog_app/core/constants/styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height,
    this.icon,
    this.shape,
    this.margin,
    this.textColor, this.outlineColor,
  });
  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final String? icon;
  final OutlinedBorder? shape;
  final EdgeInsetsGeometry? margin;
  final Color? outlineColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 50,
      margin: margin,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
          side: BorderSide(color: outlineColor ?? AppColors.secondary),
        ),
        child: Row(
          children: [
            if (icon != null)
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  icon!,
                  width: 30,
                ),
              ),
            // if(icon != null ) const SizedBox(width: CustomSizes.spaceBtwItems),
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: TextStyles.medium16
                    .copyWith(color: textColor ?? AppColors.secondary),
                textAlign: icon == null ? TextAlign.center : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
