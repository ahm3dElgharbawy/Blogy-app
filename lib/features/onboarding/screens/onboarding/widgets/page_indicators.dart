import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/app_colors.dart';

class CustomPageIndicators extends StatelessWidget {
  const CustomPageIndicators({super.key, required this.activeDot});
  final int activeDot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          3,
          (index) => AnimatedContainer(
            width: activeDot == index ? 20 : 10,
            height: 10,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: activeDot == index ? AppColors.primary : Colors.grey[300],
              borderRadius: BorderRadius.circular(5)
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5),
          ),
        )
      ],
    );
  }
}
