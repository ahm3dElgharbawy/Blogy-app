import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';

class CustomCartShimmer extends StatelessWidget {
  const CustomCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Padding(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomRoundedContainer(
              height: 50,
              width: 150,
              radius: 10,
              margin: EdgeInsets.zero,
              color: Colors.white,
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomRoundedContainer(
                    height: 100,
                    width: 150,
                    color: Colors.white,
                    radius: 8,
                  ),
                ),
                SizedBox(width: CustomSizes.sm),
                Expanded(
                  child: CustomRoundedContainer(
                    height: 80,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: CustomSizes.sm),
                CustomCircularContainer(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                )
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            ...List.generate(
              2,
              (i) => const Padding(
                padding:
                    EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRoundedContainer(
                      height: 50,
                      width: 100,
                      color: Colors.white,
                    ),
                    CustomRoundedContainer(
                      height: 50,
                      width: 100,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
