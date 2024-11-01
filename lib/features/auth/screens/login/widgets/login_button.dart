import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/layout/screens/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({super.key, required this.onLogin});
  final VoidCallback onLogin;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          await CacheHelper.setString(
            kInitialScreenIndex,
            "2",
          ); // start from home latPer
          "Login Success".showAsToast(Colors.green);
          NavigationHelper.pushReplacementAll(const AppLayoutScreen());
        } else if (state is LoginFailure) {
          state.message.showAsToast(Colors.red);
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CustomElevatedButton(
            title: "Continue",
            isLoading: true,
            onTap: null,
          );
        }
        return CustomElevatedButton(
          title: "Continue",
          onTap: onLogin,
        );
      },
    );
  }
}
