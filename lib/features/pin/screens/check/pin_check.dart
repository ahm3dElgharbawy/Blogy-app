import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/common/widgets/custom_keyboard.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/layout/screens/app_layout.dart';
import 'package:flutter/material.dart';


class PinCheckScreen extends StatefulWidget {
  const PinCheckScreen({super.key});

  @override
  State<PinCheckScreen> createState() => _PinCheckScreenState();
}

class _PinCheckScreenState extends State<PinCheckScreen> {
  String filled = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(CustomSizes.defaultSpace),
          child: SafeArea(
            child: Column(
              children: [
                Image.asset(ImagesStrings.logoPng, width: 200),
                Text(
                  "In this app,\n the PIN will be used to login",
                  style: TextStyles.regular16.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: CustomSizes.spaceBtwSections,
                  ),
                  child: Text(
                    "Enter your PIN code",
                    style: TextStyles.bold16,
                  ),
                ),
                CustomKeyboard(
                  inputLength: 5,
                  onComplete: (pin) async {
                    if (await CacheHelper.getString(kPin) == pin) { // correct pin
                      NavigationHelper.pushReplacementAll(
                        const AppLayoutScreen(),
                      );
                    } else {
                      "Invalid Pin Code".showAsToast(Colors.red);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
