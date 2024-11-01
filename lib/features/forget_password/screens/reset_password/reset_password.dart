import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/text_fields/password_text_field.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:blog_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final resetPasswordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Form(
          key: resetPasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SvgPicture.asset(
                  ImagesStrings.resetPassword,
                  height: 250,
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                "Create New Password".tr,
                style: TextStyles.semibold24,
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              Text(
                "Enter New password ".tr,
                style: TextStyles.regular20.copyWith(color: AppColors.softDark),
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              CustomPasswordTextField(
                controller: passwordController,
                hint: "Password".tr,
              ),
              const SizedBox(height: CustomSizes.spaceBtwTextFields),
              CustomPasswordTextField(
                controller: passwordConfirmationController,
                hint: "Confirm Password".tr,
                passwordToConfirmController: passwordController,
              ),
              const SizedBox(height: CustomSizes.spaceBtwSections),
              BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccess) {
                    "Password Rest Successfully".showAsToast(Colors.green);
                    NavigationHelper.pushReplacementAll(const LoginScreen());
                  } else if (state is ResetPasswordFailure) {
                    state.message.showAsToast(Colors.red);
                  }
                },
                builder: (context, state) {
                  if (state is ResetPasswordLoading) {
                    return const CustomElevatedButton(
                      title: "Done",
                      isLoading: true,
                      onTap: null,
                    );
                  }
                  return CustomElevatedButton(
                    title: "Done",
                    onTap: () {
                      if (resetPasswordFormKey.currentState!.validate()) {
                        if(passwordController.text != passwordConfirmationController.text){
                          "Password Confirmation not match".showAsToast(Colors.red);
                          return;
                        }
                        ForgetPasswordCubit.get(context).resetPassword(
                            newPassword: passwordController.text);
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
