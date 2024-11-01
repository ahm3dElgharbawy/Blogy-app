import 'package:blog_app/core/common/widgets/containers/outlined_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/features/article/screens/show/widgets/add_comment_text_field.dart';
import 'package:blog_app/features/article/screens/show/widgets/comments_bottom_sheet.dart';
import 'package:flutter/material.dart';


class CustomAddCommentCard extends StatelessWidget {
  const CustomAddCommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Comments", style: TextStyles.bold16),
                  const SizedBox(width: CustomSizes.spaceBtwItems),
                  Text(
                    "170",
                    style: TextStyles.bold14.copyWith(color: AppColors.primary),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
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
                child: const Icon(Icons.compare_arrows_outlined),
              )
            ],
          ),
          const Divider(),
          const CustomAddCommentTextField(
            articleId: 0,
          )
        ],
      ),
    );
  }
}
