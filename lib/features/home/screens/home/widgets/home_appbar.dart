import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';
import 'package:blog_app/features/article/screens/create/create_article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: CachedNetworkImageProvider(UserLocal.user!.image),
            ),
          ),
        ),
        CustomCircularContainer(
          padding: const EdgeInsets.all(5),
          color: AppColors.primary,
          child: const Icon(Icons.add, color: Colors.white),
          onTap: () {
            NavigationHelper.push(const CreateArticleScreen());
          },
        ),
        
        // PopupMenuButton(
        //   splashRadius: 20,
        //   clipBehavior: Clip.antiAlias,
        //   shape:
        //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        //   itemBuilder: (context) => [
        //     PopupMenuItem(
        //       padding: const EdgeInsets.symmetric(horizontal: 6),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           const Icon(Icons.add),
        //           SizedBox(width: CustomSizes.spaceBtwItems.w / 2),
        //           Text("New Article",style: TextStyles.regular14,)
        //         ],
        //       ),
        //       onTap: () {
        //         NavigationHelper.push(const CreateArticleScreen());
        //       },
        //     ),
        //   ],
        // )
      ],
    );
  }
}
