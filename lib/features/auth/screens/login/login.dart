import 'package:blog_app/features/auth/screens/login/widgets/login_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: const Text("Login"),
              centerTitle: true,
            )
          : null,
      body: const LoginBody()
    );
  }
}
