import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/auth/screens/login/widgets/login_button.dart';
import 'package:blog_app/features/auth/screens/login/widgets/login_form_fields.dart';
import 'package:blog_app/features/forget_password/screens/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginFromKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Form(
      key: loginFromKey,
      child: Column(
        children: [
          LoginFormFields(
            emailController: emailController,
            passwordController: passwordController,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwItems / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text(
                  "Reset Password",
                  style: TextStyles.regular14,
                ),
                onPressed: () {
                  NavigationHelper.push(const ForgotPasswordScreen());
                },
              ),
            ],
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          CustomLoginButton(
            onLogin: () {
              if (loginFromKey.currentState!.validate()) {
                AuthCubit.get(context).login(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
              // NavigationHelper.push(const PINScreen());
            },
          )
        ],
      ),
    );
  }
}
