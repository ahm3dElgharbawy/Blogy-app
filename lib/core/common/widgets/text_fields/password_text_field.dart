import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/validator.dart';

import 'package:iconsax/iconsax.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget{
  const CustomPasswordTextField({super.key, this.hint, this.controller, this.passwordToConfirmController});
  final String? hint;
  final TextEditingController? controller;
  final TextEditingController? passwordToConfirmController;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> with Validator {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isHidden,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: CustomSizes.md,
          vertical: CustomSizes.md,
        ),
        prefixIcon:  const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Icon(
            isHidden ? Iconsax.eye_slash : Iconsax.eye,
            color: AppColors.softDark,
          ),
        ),
      ),
      validator: (password) {
        if(widget.passwordToConfirmController != null){ // for validate password confirmation
          return validateConfirmPassword(password, widget.passwordToConfirmController!.text);
        }
        return validatePassword(password);
      },
    );
  }
}
