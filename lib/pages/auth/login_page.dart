import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/auth/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Center(
            child: SizedBox(
              width: 400,
              child: Padding(padding: EdgeInsets.all(24), child: LoginForm()),
            ),
          ),
        ),
      ),
    );
  }
}
