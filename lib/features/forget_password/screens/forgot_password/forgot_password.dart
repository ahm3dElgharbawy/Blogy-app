import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:blog_app/features/forget_password/screens/otp/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: SvgPicture.asset(
              ImagesStrings.forgetPassword,
              height: 250,
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Text(
            "Forgot Password?".tr,
            style: TextStyles.semibold24,
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Text(
            "Don't worry ! Please enter your email address".tr,
            style: TextStyles.regular20.copyWith(color: AppColors.softDark),
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          Form(
            key: formKey,
            child: CustomTextField(
              hint: "Email".tr,
              keyboardType: TextInputType.emailAddress,
              prefix: const Icon(
                Icons.email,
              ),
              controller: emailController,
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is CheckEmailSuccess) {
                NavigationHelper.push(const OTPScreen());
              } else if (state is CheckEmailFailure) {
                state.message.showAsToast(Colors.red);
              }
            },
            builder: (context, state) {
              if (state is CheckEmailLoading) {
                return const CustomElevatedButton(
                  title: "Continue",
                  isLoading: true,
                  onTap: null,
                );
              }
              return CustomElevatedButton(
                title: "Continue",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    ForgetPasswordCubit.get(context)
                        .checkEmail(email: emailController.text);
                  }
                },
              );
            },
          )
        ]),
      ),
    );
  }
}
