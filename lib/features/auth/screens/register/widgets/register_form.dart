import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/auth/screens/register/widgets/register_button.dart';
import 'package:blog_app/features/auth/screens/register/widgets/register_form_fields.dart';
import 'package:flutter/material.dart';

class CustomRegisterForm extends StatefulWidget {
  const CustomRegisterForm({super.key});
  @override
  State<CustomRegisterForm> createState() => _CustomRegisterFormState();
}

class _CustomRegisterFormState extends State<CustomRegisterForm> {
  final registerFromKey = GlobalKey<FormState>();
  final controllers = List.generate(4, (i) => TextEditingController());
  @override
  void dispose() {
    super.dispose();
    for (TextEditingController t in controllers) {
      t.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFromKey,
      child: Column(
        children: [
          RegisterFormFields(
            nameController: controllers[0],
            emailController: controllers[1],
            phoneController: controllers[2],
            passwordController: controllers[3],
          ),
          const SizedBox(
            height: CustomSizes.spaceBtwItems,
          ),
          CustomRegisterButton(
            onRegister: () {
              if (registerFromKey.currentState!.validate()) {
                AuthCubit.get(context).register(data: {
                  'name': controllers[0].text,
                  'email': controllers[1].text,
                  'phone': controllers[2].text,
                  'password': controllers[3].text,
                  'password_confirmation': controllers[3].text,
                });
              }
            },
          )
        ],
      ),
    );
  }
}
