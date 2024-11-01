import 'package:blog_app/core/common/widgets/containers/outlined_container.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/features/article/data/models/comment.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomComment extends StatelessWidget {
  const CustomComment({
    super.key, required this.comment,
  });

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        //? custom user comment with profile and data of commit
        CustomOutlinedContainer(
          margin: const EdgeInsets.only(bottom:CustomSizes.spaceBtwItems ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 40,
                    width: 40,
                    child:  ClipOval(
                      child: CachedNetworkImage(imageUrl: comment.user.image),
                    )
                  ),
                  const SizedBox(width: CustomSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.user.name,
                        style: TextStyles.bold14,
                      ),
                      Text(
                        comment.createdAt.inAgo,
                        style: TextStyles.bold12
                            .copyWith(color: Colors.grey, height: 1.5),
                      )
                    ],
                  )
                ],
              ),
              const Divider(height: 30),
              Text(comment.comment),
            ],
          ),
        ),
      ],
    );
  }
}
