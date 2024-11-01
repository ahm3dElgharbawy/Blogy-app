import 'package:blog_app/core/common/widgets/custom_keyboard.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:blog_app/features/pin/screens/confirm/confirm_bin.dart';
import 'package:flutter/material.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: CustomSizes.spaceBtwSections,
            ),
            child: Text(
              "Create New Pin",
              style: TextStyles.semibold18,
            ),
          ),
          CustomKeyboard(inputLength: 5,onComplete: (pin) {
            print(pin);
            NavigationHelper.pushReplacement(ConfirmPinScreen(previousPin: pin));
          })
        ]),
      ),
    );
  }
}
