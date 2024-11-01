import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/app_colors.dart';

class CustomSliderCardWidget extends StatelessWidget {
  const CustomSliderCardWidget(
      {super.key, required this.image, this.onTap, this.boxFit = BoxFit.cover});
  final String image;
  final VoidCallback? onTap;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (context,s) => Container(
              color: AppColors.light,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
