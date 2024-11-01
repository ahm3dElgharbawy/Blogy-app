import 'package:blog_app/core/common/widgets/buttons/elevated_button.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({super.key, required this.onRegister});
  final VoidCallback onRegister;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          "Register Success".showAsToast(Colors.green);
          NavigationHelper.pushReplacementAll(const LoginScreen());
        } else if (state is RegisterFailure) {
          state.message.showAsToast(Colors.red);
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CustomElevatedButton(
            title: "Register",
            isLoading: true,
            onTap: null,
          );
        }
        return CustomElevatedButton(
          title: "Register",
          onTap: onRegister
        );
      },
    );
  }
}
