import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/styles.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    this.onTap,
    this.width = double.infinity,
    this.height,
    this.color = AppColors.primary,
    this.margin,
    this.isLoading = false,
    this.loadingIndicatorColor = Colors.white,
    this.shape,
  });
  final String title;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final Color color;
  final EdgeInsetsGeometry? margin;
  final bool isLoading;
  final Color loadingIndicatorColor;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 50,
      margin: margin,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
        ),
        child: isLoading
            ? Center(
                child: Transform.scale(
                  scale: .7,
                  child:
                      CircularProgressIndicator(color: loadingIndicatorColor),
                ),
              )
            : FittedBox(
              child: Text(
                  title,
                  style: TextStyles.medium16.copyWith(color: Colors.white),
                ),
            ),
      ),
    );
  }
}
