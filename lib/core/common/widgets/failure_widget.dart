import 'package:blog_app/core/common/widgets/buttons/icon_button.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomIconButton(
        onTap: onTap,
        icon: const Icon(
          Icons.replay_circle_filled_outlined,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
