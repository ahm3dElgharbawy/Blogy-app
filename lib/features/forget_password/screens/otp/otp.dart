import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/images_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:blog_app/features/forget_password/screens/otp/widgets/timer_widget.dart';
import 'package:blog_app/features/forget_password/screens/reset_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(CustomSizes.defaultSpace),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
            child: SvgPicture.asset(
              ImagesStrings.otp,
              height: 250,
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Text(
            "Verification".tr,
            style: TextStyles.semibold24,
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
          Text(
            "Enter Verification Code".tr,
            style: TextStyles.regular20.copyWith(color: AppColors.softDark),
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is CheckOtpSuccess) {
                    NavigationHelper.push(const ResetPasswordScreen());
                  } else if (state is CheckOtpFailure) {
                    state.message.showAsToast(Colors.red);
                  }
                },
                child: //?? here we add otp
                    Directionality(
                  textDirection: TextDirection.ltr,
                  child: OTPTextField(
                    otpFieldStyle: OtpFieldStyle(
                      focusBorderColor: AppColors.primary,
                      backgroundColor: AppColors.light,
                    ),
                    fieldWidth: 40,
                    length: 6,
                    fieldStyle: FieldStyle.box,
                    width: 260,
                    style: TextStyles.medium14,
                    onChanged: (val) {},
                    onCompleted: (otp) {
                      ForgetPasswordCubit.get(context).checkOtp(otp: otp);
                    },
                  ),
                ),
              ),
              const SizedBox(height: CustomSizes.spaceBtwItems),
              const TimerWidget()
            ],
          ),
          const SizedBox(height: CustomSizes.spaceBtwSections),
        ]),
      ),
    );
  }
}
