import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.color = AppColors.softGrey,
    this.foregroundColor = Colors.white,
    this.margin,
    this.padding,
    this.onTap,
  });

  final Widget? child;
  final Color color;
  final Color foregroundColor;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: child == null
            ? null
            : Center(
                child: child,
              ),
      ),
    );
  }
}
