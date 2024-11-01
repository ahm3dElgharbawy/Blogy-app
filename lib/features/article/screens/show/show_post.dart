import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/features/article/screens/show/widgets/comments_bottom_sheet.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class ShowPostScreen extends StatelessWidget {
  const ShowPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            //? post category and time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRoundedContainer(
                  color: Colors.deepOrange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  radius: 6,
                  child: Text(
                    "business".toUpperCase(),
                    style: TextStyles.semibold12.copyWith(color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Iconsax.clock,
                        size: 16, color: AppColors.softGrey),
                    const SizedBox(width: CustomSizes.spaceBtwItems / 2),
                    Text(
                      "50m ago",
                      style: TextStyles.medium12
                          .copyWith(color: AppColors.softGrey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            //? post title
            Text(
              "How to run a More Effective Meeting",
              style: TextStyles.semibold20,
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            //? post image
            SizedBox(
              // height: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  ImagesStrings.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            Text(
              "it may seem like an obvious requirement, but a lot of meetings start with no clear, it may seem like an obvious requirement, but a lot of meetings start with no clear, it may seem like an obvious requirement, but a lot of meetings start with no clear",
              style: TextStyles.regular14.copyWith(height: 1.5),
            ),
            const SizedBox(height: CustomSizes.spaceBtwSections),
            // CustomPostCommentsReactions(article: article,),
            const Divider(
              height: 10,
            ),
            //? reaction
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share_outlined),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => const CustomCommentsBottomSheet(
                        articleId: 0,
                        commentsCount: 0,
                      ),
                    );
                  },
                  icon: const Icon(Iconsax.message_text),
                ),
                // ReactionButton(article: article),
              ],
            ),
            const SizedBox(height: CustomSizes.spaceBtwItems),
            // const CustomAddCommentCard()
          ],
        ),
      ),
    );
  }
}
