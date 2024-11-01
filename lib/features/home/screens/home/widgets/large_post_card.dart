import 'package:blog_app/core/common/widgets/buttons/icon_button.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_image.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/helper_functions.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:blog_app/features/home/screens/home/widgets/time_and_comments.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class CustomLargePostCard extends StatelessWidget {
  const CustomLargePostCard({super.key, this.margin, required this.article});
  final EdgeInsetsGeometry? margin;
  final ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.image != null) CustomRoundedImage(image: article.image!),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                article.title,
                style: TextStyles.semibold20,
                maxLines: 2,
              ),
              CustomIconButton(
                onTap: () {},
                icon: const Icon(
                  Iconsax.edit,
                  size: 18,
                ),
              )
            ],
          ),
          Row(
            children: [
              CustomRoundedContainer(
                color: Color(int.parse(article.category.color.replaceAll('#',"ff"),radix: 16)),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                radius: 6,
                width: null,
                child: Text(
                  CustomHelperFunctions.trans(enText: article.category.nameEn.toUpperCase(), arText: article.category.nameAr),
                  style: TextStyles.semibold12.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          CustomTimeAndCommentsRow(
            time: article.createdAt.inAgo,
            commentsCount: article.commentsCount,
          ),
        ],
      ),
    );
  }
}
