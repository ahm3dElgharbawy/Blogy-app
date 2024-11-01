import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/containers/circular_container.dart';
import 'package:blog_app/core/common/widgets/list_tile/setting_list_tile.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';
import 'package:blog_app/features/setting/screens/settings/settings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: CustomSizes.spaceBtwItems),
          height: context.screenHeight,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: UserLocal.user!.image,
                    height: 80,
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwItems),
                Text("Ahmed Elgharbawy", style: TextStyles.semibold18),
                const SizedBox(height: CustomSizes.spaceBtwSections),
                CustomSettingListTile(
                  title: "My Articles",
                  leadingIcon: Iconsax.document,
                  onTap: () {},
                ),
                CustomSettingListTile(
                  title: "Notifications",
                  leadingIcon: Iconsax.notification,
                  showTrailing: true,
                  trailing: CustomCircularContainer(
                    color: AppColors.primary,
                    height: 25,
                    width: 25,
                    child: Text(
                      "+9",
                      style:
                          TextStyles.semibold12.copyWith(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // NavigationHelper.push(const SettingsScreen());
                  },
                ),
                CustomSettingListTile(
                  title: "Profile & Settings",
                  leadingIcon: Iconsax.setting_2,
                  onTap: () {
                    NavigationHelper.push(const SettingsScreen());
                  },
                ),
                const Spacer(),
                CustomElevatedButton(
                  onTap: () {},
                  color: AppColors.red,
                  title: "Sign out",
                  shape: const StadiumBorder(),
                  margin: const EdgeInsets.symmetric(
                    horizontal: CustomSizes.defaultSpace,
                  ),
                ),
                const SizedBox(height: CustomSizes.spaceBtwItems)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
