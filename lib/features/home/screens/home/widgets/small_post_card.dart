import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/article/screens/show/show_post.dart';
import 'package:flutter/material.dart';


class CustomSmallPostCard extends StatelessWidget {
  const CustomSmallPostCard({super.key, this.margin});
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    bool isSaved = true;
    return InkWell(
      onTap: () {
        NavigationHelper.push(const ShowPostScreen());
      },
      child: Container(
        margin: margin ?? const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  ImagesStrings.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: CustomSizes.spaceBtwItems),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRoundedContainer(
                        color: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        radius: 6,
                        child: Text(
                          "design".toUpperCase(),
                          style: TextStyles.semibold12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: isSaved
                            ? const Icon(Icons.bookmark,
                                color: AppColors.primary)
                            : const Icon(
                                Icons.bookmark_outline_rounded,
                                color: Colors.grey,
                              ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CustomSizes.spaceBtwItems / 2),
                    child: Text(
                      "Top 10 techniques to get rid of clutters in design system system system",
                      style: TextStyles.semibold14.copyWith(height: 1.4),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                    ),
                  ),
                  // const CustomTimeAndCommentsRow()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
