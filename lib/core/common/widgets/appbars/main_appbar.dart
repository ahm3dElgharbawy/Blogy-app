import 'package:flutter/material.dart';
import 'package:blog_app/core/constants/styles.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomMainAppBar({
    super.key,
    this.title,
    this.action,
    this.centerTitle = true,
  });
  final String? title;
  final Widget? action;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null
          ? null
          : Text(
              title!,
              style: TextStyles.medium24,
            ),
      automaticallyImplyLeading: true,
      centerTitle: centerTitle,
      actions: [
        if (action != null)
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: action!,
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
