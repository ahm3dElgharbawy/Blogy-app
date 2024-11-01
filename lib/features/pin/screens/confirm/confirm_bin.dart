import 'package:blog_app/core/common/widgets/custom_keyboard.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class ConfirmPinScreen extends StatelessWidget {
  const ConfirmPinScreen({super.key, required this.previousPin});
  final String previousPin;

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
              "Please Confirm your new pin",
              style: TextStyles.semibold18,
            ),
          ),
          CustomKeyboard(inputLength: 5,onComplete: (currentPin) {
            if(previousPin == currentPin){
              CacheHelper.setString(kPin, currentPin);
              "The app is now locked".showAsToast(Colors.green);
              NavigationHelper.pop();
            } else{
              "Pin confirmation not correct".showAsToast(Colors.red);
            }
          })
        ]),
      ),
    );
  }
}
