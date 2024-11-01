import 'package:blog_app/features/auth/screens/register/widgets/register_body.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        centerTitle: true,
      ),
      body: const RegisterBody()
    );
  }
}
