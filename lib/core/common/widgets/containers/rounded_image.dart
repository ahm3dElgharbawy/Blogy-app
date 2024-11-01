import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomRoundedImage extends StatelessWidget {
  const CustomRoundedImage({super.key, required this.image, this.height = 160, this.radius});
  final String image;
  final double height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 20),
        child: CachedNetworkImage(
          imageUrl: image,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
