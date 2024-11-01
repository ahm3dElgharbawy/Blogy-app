import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/helpers/responsive_helpers/device_utils.dart';
import 'package:blog_app/features/auth/screens/login/widgets/login_form.dart';
import 'package:blog_app/features/auth/screens/login/widgets/not_have_account.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Row(
        children: [
          if (DeviceUtils.isDesktop(context))
            Flexible(
              child: Image.asset(
                ImagesStrings.logoPng,
                height: 180,
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (!DeviceUtils.isDesktop(context))
                    Image.asset(
                      ImagesStrings.logoPng,
                      height: 180,
                    ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  //? login form
                  const CustomLoginForm(),
                  const SizedBox(
                    height: CustomSizes.spaceBtwItems,
                  ),
                  //? don't have an account
                  const NotHaveAccount()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
