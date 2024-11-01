import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/article/logic/comment_cubit/comment_cubit.dart';
import 'package:blog_app/features/article/screens/show/widgets/add_comment_text_field.dart';
import 'package:blog_app/features/article/screens/show/widgets/custom_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCommentsBottomSheet extends StatefulWidget {
  const CustomCommentsBottomSheet({
    super.key,
    required this.commentsCount,
    required this.articleId,
  });
  final int articleId;
  final int commentsCount;

  @override
  State<CustomCommentsBottomSheet> createState() =>
      _CustomCommentsBottomSheetState();
}

class _CustomCommentsBottomSheetState extends State<CustomCommentsBottomSheet> {
  late final CommentCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = CommentCubit.get(context)..getComments(widget.articleId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: kToolbarHeight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(CustomSizes.defaultSpace),
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
                            widget.commentsCount.toString(),
                            style: TextStyles.bold14
                                .copyWith(color: AppColors.primary),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationHelper.pop();
                        },
                        child: const Icon(Icons.close_rounded),
                      )
                    ],
                  ),
                  const Divider(
                    height: 30,
                  ),
                  // const CustomAvatarWithTextField(),
                  const SizedBox(height: CustomSizes.spaceBtwItems),

                  BlocConsumer<CommentCubit, CommentState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CommentsLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Column(
                        children: List.generate(
                          cubit.comments.length,
                          (i) => CustomComment(
                            comment: cubit.comments[i],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(CustomSizes.defaultSpace),
            child: CustomAddCommentTextField(
              articleId: widget.articleId,
            ),
          )
        ],
      ),
    );
  }
}
