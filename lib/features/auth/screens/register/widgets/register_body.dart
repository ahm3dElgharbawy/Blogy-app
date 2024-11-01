import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/auth/screens/register/widgets/already_have_account.dart';
import 'package:blog_app/features/auth/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Column(
        children: [
          SvgPicture.asset(
            ImagesStrings.register,
            height: 210,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwSections,
          ),
          //? register form
          const CustomRegisterForm(),
          const SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          //? already have an account
          const AlreadyHaveAccount()
        ],
      ),
    );
  }
}
