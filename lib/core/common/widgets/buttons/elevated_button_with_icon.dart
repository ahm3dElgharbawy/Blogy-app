import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/styles.dart';


class CustomElevatedButtonWithIcon extends StatelessWidget {
  const CustomElevatedButtonWithIcon(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon,
      this.iconDirection = AxisDirection.left,
      this.width = double.infinity,
      this.height = 50});
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final AxisDirection iconDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: const StadiumBorder(),
          padding: EdgeInsets.zero,
        ),
        child: FittedBox(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (iconDirection == AxisDirection.left)
              Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
            Text(
              title,
              style:TextStyles.medium16.copyWith(color: Colors.white),
            ),
            if (iconDirection == AxisDirection.right)
              Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
          ]),
        ),
      ),
    );
  }
}
