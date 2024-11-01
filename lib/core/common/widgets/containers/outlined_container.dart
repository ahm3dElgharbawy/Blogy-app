import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/sizes.dart';

class CustomOutlinedContainer extends StatelessWidget {
  const CustomOutlinedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.radius = 10,
    this.color,
    this.margin,
    this.onTap,
    this.padding,
    this.alignment = Alignment.center,
    this.border, this.image,
    this.strokeWidth = 1
  });

  final Widget? child;
  final double radius;
  final Color? color;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final AlignmentGeometry? alignment;
  final BoxBorder? border;
  final DecorationImage? image;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding ?? const EdgeInsets.all(CustomSizes.md),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: border ?? Border.all(color: Colors.grey[300]!,width: strokeWidth),
          image: image
        ),
        child: child,
      ),
    );
  }
}
