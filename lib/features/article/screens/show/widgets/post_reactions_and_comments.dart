import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/features/article/logic/reaction_cubit/reaction_cubit.dart';
import 'package:blog_app/features/home/data/models/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomPostCommentsReactions extends StatelessWidget {
  const CustomPostCommentsReactions({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    double iconSize = 20;

    return SizedBox(
      height: 40,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: article.commentsCount != 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Comments", style: TextStyles.semibold14),
                const SizedBox(width: CustomSizes.spaceBtwItems),
                Text(
                  article.commentsCount.toString(),
                  style:
                      TextStyles.semibold14.copyWith(color: AppColors.primary),
                )
              ],
            ),
          ),
          //? reactions with images
          BlocBuilder<ReactionCubit, ReactionState>(
            builder: (context, state) {
              return Visibility(
                visible: article.reactionsCount != 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      article.reactionsCount.toString(),
                      style: TextStyles.regular12,
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      width: article.reactionsImages.length * iconSize - (article.reactionsImages.length - 1) * 5,
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: article.reactionsImages
                            .asMap()
                            .entries
                            .map(
                              (entry) => Positioned(
                                right: entry.key *
                                    (iconSize - 5), // Adjust spacing as needed
                                child: Image.asset(
                                  entry.value,
                                  height: iconSize,
                                  width: iconSize,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
