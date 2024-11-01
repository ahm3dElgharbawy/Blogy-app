import 'package:blog_app/core/common/widgets/text_fields/password_text_field.dart';
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key, required this.emailController, required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          hint: "Email address",
          keyboardType: TextInputType.emailAddress,
          prefix: const Icon(Icons.mail_rounded, size: 20),
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwTextFields,
        ),
        CustomPasswordTextField(
          controller: passwordController,
          hint: "Password",
        ),
      ],
    );
  }
}
