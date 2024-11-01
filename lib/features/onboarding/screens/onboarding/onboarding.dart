import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/common/widgets/buttons/elevated_button_with_icon.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:blog_app/features/onboarding/logic/cubit/onboarding_cubit.dart';
import 'package:blog_app/features/onboarding/screens/onboarding/widgets/page_indicators.dart';
import 'package:blog_app/features/onboarding/screens/onboarding/widgets/page_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) async {
            if (state is OnboardingCompletedState) {
              CacheHelper.setString(kInitialScreenIndex, "1");
              NavigationHelper.pushReplacementAll(const LoginScreen());
            }
          },
          builder: (context, state) {
            OnboardingCubit cubit = context.read<OnboardingCubit>();
            return SafeArea(
              child: Column(
                children: [
                  //? Skip button
                  Visibility(
                    maintainState : true,
                    maintainSize: true,
                    maintainAnimation: true,
                    visible: cubit.currentPageIndex != 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomElevatedButtonWithIcon(
                            onTap: () {
                              cubit.skip();
                            },
                            icon: Icons.arrow_forward_ios_rounded,
                            iconDirection: AxisDirection.right,
                            width: 70,
                            height: 35,
                            title: "Skip".tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //? Page view
                  Expanded(
                    child: CustomOnboardingPageView(
                      pageController: cubit.pageController,
                      onPageChanged: (pageIndex) {
                        cubit.swipe(pageIndex);
                      },
                    ),
                  ),
                  //? indicators
                  Padding(
                    padding: const EdgeInsets.only(bottom: CustomSizes.spaceBtwItems),
                    child: CustomPageIndicators(
                      activeDot: cubit.currentPageIndex,
                    ),
                  ),
                  //? next button
                  CustomElevatedButton(
                      title:
                          cubit.currentPageIndex == 2 ? "Finish".tr : "Next".tr,
                      color: AppColors.primary,
                      // width: 300,
                      margin: const EdgeInsets.all(CustomSizes.defaultSpace)
                          .copyWith(bottom: 40),
                      onTap: () {
                        cubit.next();
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
