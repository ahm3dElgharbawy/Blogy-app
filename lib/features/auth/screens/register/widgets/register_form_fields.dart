import 'package:blog_app/core/common/widgets/text_fields/password_text_field.dart';
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          hint: "Username",
          prefix: const Icon(Icons.person),
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwTextFields,
        ),
        CustomTextField(
          controller: emailController,
          hint: "Email address",
          prefix: const Icon(Icons.mail_rounded),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(
          height: CustomSizes.spaceBtwTextFields,
        ),
        CustomTextField(
          controller: phoneController,
          hint: "Phone number",
          prefix: const Icon(Icons.phone),
          keyboardType: TextInputType.phone,
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
