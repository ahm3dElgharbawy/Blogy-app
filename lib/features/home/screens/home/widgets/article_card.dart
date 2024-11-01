import 'package:blog_app/core/common/widgets/buttons/material_button.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_image.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/features/article/screens/show/widgets/comments_bottom_sheet.dart';
import 'package:blog_app/features/article/screens/show/widgets/post_reactions_and_comments.dart';
import 'package:blog_app/features/article/screens/show/widgets/reaction_button.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:blog_app/features/home/screens/home/widgets/time.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class CustomArticleCard extends StatelessWidget {
  const CustomArticleCard({super.key, required this.article});
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      margin: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: article.user.image,
                  height: 35,
                ),
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.user.name,
                    style: TextStyles.semibold14,
                  ),
                  CustomTimeWidget(timeInAgo: article.createdAt.inAgo)
                ],
              )
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Text(
            article.title, // "How to run a More Effective Meeting?"
            style: TextStyles.semibold18,
          ),
          if (article.image != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: CustomSizes.spaceBtwItems),
              child: CustomRoundedImage(image: article.image!),
            ),
          ReadMoreText(
            // "it may seem like an obvious requirement, but a lot of meetings start with no clear, it may seem like\nbut a lot of meetings start with no clear, it may seem like"
            article.body,
            trimLines: 3,
            trimMode: TrimMode.Line,
            moreStyle: TextStyles.semibold14.copyWith(color: AppColors.primary),
            lessStyle: TextStyles.semibold14.copyWith(color: AppColors.primary),
            trimExpandedText: " show less",
            trimCollapsedText: "show more",
            style: TextStyles.regular14,
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          //? article reactions and comments
          CustomPostCommentsReactions(article: article),
          CustomRoundedContainer(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomMaterialButton(
                  child: const Icon(Icons.share_outlined),
                  onTap: () {},
                ),
                CustomMaterialButton(
                  child: const Icon(Iconsax.message_text),
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) =>  CustomCommentsBottomSheet(
                        articleId: article.id,
                        commentsCount: article.commentsCount,
                      ),
                    );
                  },
                ),
                ReactionButton(article: article)
              ],
            ),
          )
        ],
      ),
    );
  }
}
