import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.child, this.onTap});
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: MaterialButton(
        onPressed: onTap,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
