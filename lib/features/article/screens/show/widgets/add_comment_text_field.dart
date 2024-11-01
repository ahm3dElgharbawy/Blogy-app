import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/article/logic/comment_cubit/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomAddCommentTextField extends StatefulWidget {
  const CustomAddCommentTextField({super.key, required this.articleId});
  final int articleId;
  @override
  State<CustomAddCommentTextField> createState() =>
      _CustomAddCommentTextFieldState();
}

class _CustomAddCommentTextFieldState extends State<CustomAddCommentTextField> {
  bool showSubmit = false;
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            maxLines: 10,
            controller: commentController,
            contentPadding: const EdgeInsets.all(CustomSizes.md),
            fillColor: Colors.transparent,
            hint: "Add a comment ...",
            keyboardType: TextInputType.multiline,
            onChanged: (val) {
              if (val.trim() == "") {
                showSubmit = false;
              } else {
                showSubmit = true;
              }
              setState(() {});
            },
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.softGrey),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
        if (showSubmit)
          BlocConsumer<CommentCubit, CommentState>(
            listener: (context, state) {
              if (state is AddCommentSuccess) {
                commentController.clear();
                setState(() {
                  showSubmit = false;
                });
              }
            },
            builder: (context, state) {
              return IconButton(
                icon: const Icon(
                  Icons.send,
                  color: AppColors.primary,
                ),
                splashRadius: 20,
                style: IconButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  CommentCubit.get(context).addComment(
                    widget.articleId,
                    commentController.text,
                  );
                },
              );
            },
          )
      ],
    );
  }
}
