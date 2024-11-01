import 'dart:developer';

import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/buttons/outlined_button.dart';
import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/setting/data/local/app_languages.dart';
import 'package:flutter/material.dart';


class CustomLanguageBottomSheet extends StatefulWidget {
  const CustomLanguageBottomSheet({super.key});

  @override
  State<CustomLanguageBottomSheet> createState() =>
      _CustomLanguageBottomSheetState();
}

class _CustomLanguageBottomSheetState extends State<CustomLanguageBottomSheet> {
  int selectedLangIndex = 1;
  String selectedLangCode = 'en';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomSizes.defaultSpace),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "App Language",
            style: TextStyles.medium22,
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          //? available language
          ...AppLanguages.get.asMap().entries.map(
                (lang) => CustomRoundedContainer(
                  onTap: () {
                    setState(() {
                      selectedLangIndex = lang.key;
                      selectedLangCode = lang.value.langCode;
                    });
                    log(selectedLangCode);
                  },
                  radius: 15,
                  margin: const EdgeInsets.only(
                    bottom: CustomSizes.spaceBtwItems,
                  ),
                  padding: const EdgeInsets.all(CustomSizes.md),
                  color: AppColors.primary.withOpacity(.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            lang.value.countryImage,
                            height: 30,
                          ),
                          const SizedBox(width: CustomSizes.spaceBtwItems),
                          Text(lang.value.language, style: TextStyles.medium14),
                        ],
                      ),
                      if (selectedLangIndex == lang.key)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primary,
                          size: 20,
                        )
                    ],
                  ),
                ),
              ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          Row(
            children: [
              Expanded(
                child: CustomOutlinedButton(
                    onTap: () {
                      NavigationHelper.pop();
                    },
                    title: "Cancel"),
              ),
              const SizedBox(width: CustomSizes.spaceBtwItems),
              Expanded(
                child: CustomElevatedButton(
                  onTap: () {
                    //? apply language
                  },
                  title: "Confirm",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
