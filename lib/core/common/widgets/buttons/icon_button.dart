import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.backgroundColor = Colors.transparent,
  });
  final VoidCallback onTap;
  final Icon icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: backgroundColor,
      child: IconButton(
        onPressed: onTap,
        icon: icon,
      ),
    );
  }
}
