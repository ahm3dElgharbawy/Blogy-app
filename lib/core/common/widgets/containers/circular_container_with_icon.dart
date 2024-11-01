import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularContainerWithIcon extends StatelessWidget {
  const CustomCircularContainerWithIcon({
    super.key,
    required this.icon,
    this.iconSize = 35,
    this.height = 80,
    this.width = 80,
    this.color = AppColors.primary,
    this.iconColor = Colors.white,
    this.onTap,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final double height;
  final double width;
  final double iconSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
