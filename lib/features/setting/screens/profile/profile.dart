import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/text_fields/text_field.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:blog_app/features/setting/screens/profile/widgets/avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(
          children: [
            const CustomProfileAvatarWithEditIcon(),
            SizedBox(height: context.setHeight(CustomSizes.spaceBtwItems)),
            Text(
              "Ahmed Elgharbawy",
              style: TextStyles.medium16,
            ),
            SizedBox(height: context.setHeight(CustomSizes.spaceBtwSections)),
            const CustomTextField(
              hint: "Username",
              prefix: Icon(Icons.person),
            ),
            SizedBox(height: context.setHeight(CustomSizes.spaceBtwTextFields)),
            const CustomTextField(
              hint: "Email",
              prefix: Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: context.setHeight(CustomSizes.spaceBtwTextFields)),
            const CustomTextField(
              hint: "Phone",
              prefix: Icon(Icons.phone),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: context.setHeight(CustomSizes.spaceBtwTextFields)),
            CustomElevatedButton(
              title: "Save",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
