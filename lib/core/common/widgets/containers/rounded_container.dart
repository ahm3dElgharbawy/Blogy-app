import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  const CustomRoundedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.radius = 10,
    this.color = AppColors.light,
    this.margin,
    this.onTap,
    this.padding,
  });

  final Widget? child;
  final double radius;
  final Color color;
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
        clipBehavior: Clip.hardEdge,
        height: height,
        width: width,
        margin: margin,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
