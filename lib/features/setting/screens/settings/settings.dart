import 'package:blog_app/core/common/widgets/buttons/outlined_button.dart';
import 'package:blog_app/core/common/widgets/dialogs/loading_dialog.dart';
import 'package:blog_app/core/common/widgets/list_tile/setting_list_tile.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:blog_app/features/pin/screens/create/create_pin.dart';
import 'package:blog_app/features/setting/screens/profile/profile.dart';
import 'package:blog_app/features/setting/screens/settings/widgets/language_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace,
              ),
              child: Text(
                "Account",
                style: TextStyles.medium18.copyWith(color: AppColors.softDark),
              ),
            ),
            CustomSettingListTile(
              title: "Account Details",
              leadingIcon: Icons.account_circle_outlined,
              showTrailing: true,
              onTap: () {
                NavigationHelper.push(const ProfileScreen());
              },
            ),
            CustomSettingListTile(
              title: "Close My Account",
              leadingIcon: Iconsax.profile_delete,
              showTrailing: true,
              onTap: () {},
            ),
            const Divider(
              height: 30,
              thickness: 1.5,
            ),

            //? settings
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace,
              ),
              child: Text("Personalization",
                  style:
                      TextStyles.medium18.copyWith(color: AppColors.softDark)),
            ),
            CustomSettingListTile(
              title: "Appearance",
              leadingIcon: Icons.color_lens_outlined,
              showTrailing: true,
              onTap: () {},
            ),
            CustomSettingListTile(
              title: "Language",
              leadingIcon: Iconsax.global,
              showTrailing: true,
              trailing: Text(
                "English",
                style: TextStyles.medium14.copyWith(color: AppColors.primary),
              ),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  builder: (context) => const CustomLanguageBottomSheet(),
                );
              },
            ),
            const Divider(
              height: 30,
              thickness: 1.5,
            ),
            //? privacy and security
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace,
              ),
              child: Text("Security",
                  style:
                      TextStyles.medium18.copyWith(color: AppColors.softDark)),
            ),
            CustomSettingListTile(
              title: "PassCode Lock",
              leadingIcon: Icons.lock_outline_rounded,
              showTrailing: true,
              trailing: Text(
                "Off",
                style: TextStyles.medium14.copyWith(color: AppColors.primary),
              ),
              onTap: () {
                NavigationHelper.push(const CreatePinScreen());
              },
            ),
            CustomSettingListTile(
              title: "Change Password",
              leadingIcon: Icons.lock_reset_outlined,
              showTrailing: true,
              onTap: () {

              },
            ),

            //? SignOut button
            const SizedBox(height: CustomSizes.spaceBtwSections),
            CustomOutlinedButton(
              title: "Sign out",
              margin: const EdgeInsets.symmetric(
                horizontal: CustomSizes.defaultSpace,
              ),
              shape: const StadiumBorder(side: BorderSide(color: Colors.black)),
              textColor: AppColors.red,
              outlineColor: Colors.black,
              onTap: () {
                AuthCubit.get(context).logout();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LogoutSuccess) {
                        CacheHelper.setString(kInitialScreenIndex, "1");
                        NavigationHelper.pushReplacementAll(
                          const LoginScreen(),
                        );
                      } else if (state is LogoutFailure) {
                        state.message.showAsToast(Colors.red);
                        NavigationHelper.pop();
                      }
                    },
                    child: const CustomLoadingDialog(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
