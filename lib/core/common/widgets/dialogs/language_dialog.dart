import 'package:blog_app/core/common/widgets/containers/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/localization/cubit/locale_cubit.dart';

class CustomLanguageDialog extends StatelessWidget {
  const CustomLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocaleCubit, LocaleState>(
      listener: (context, state) {
        if (state is ChangeLocaleState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: state is ChangeLocaleState
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRoundedContainer(
                      padding: const EdgeInsets.all(CustomSizes.md),
                      color: AppColors.softGrey,
                      onTap: () {
                        context.read<LocaleCubit>().changeLocale("ar");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Arabic".tr,
                            style: TextStyles.medium16,
                          ),
                          if (state.locale.languageCode == 'ar')
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.primary,
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwItems),
                    CustomRoundedContainer(
                      padding: const EdgeInsets.all(CustomSizes.md),
                      color: AppColors.softGrey,
                      onTap: () {
                        context.read<LocaleCubit>().changeLocale("en");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "English".tr,
                            style: TextStyles.medium16,
                          ),
                          if (state.locale.languageCode == 'en')
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.primary,
                            )
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
