// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:project_fullstack/controllers/auth_controller.dart';
import 'package:project_fullstack/routes/app_routes.dart';
import 'login_field.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _identifier = TextEditingController();
  final _password = TextEditingController();
  final _auth = AuthController();

  bool _isLoading = false;
  bool _obscure = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    final role = await _auth.login(_identifier.text, _password.text);
    setState(() => _isLoading = false);

    if (role == 'admin') {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else if (role == 'user') {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email/Username atau password salah!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(image: AssetImage('assets/images/LogoMobile.png')),
          const SizedBox(height: 12),
          const Text(
            'Enter your username and password correctly',
            style: TextStyle(
              color: Color(0xFF5B5C63),
              fontSize: 14,
              fontFamily: 'Inter',
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          LoginField(
            label: 'Username atau Email',
            hint: 'Masukkan username atau email',
            controller: _identifier,
            validator: (v) => v!.isEmpty ? 'Username/Email wajib diisi' : null,
          ),
          const SizedBox(height: 16),

          LoginField(
            label: 'Password',
            hint: 'Enter password',
            controller: _password,
            obscureText: _obscure,
            validator: (v) => v!.isEmpty ? 'Password wajib diisi' : null,
            suffix: IconButton(
              icon: Icon(
                _obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () => setState(() => _obscure = !_obscure),
            ),
          ),

          const SizedBox(height: 24),
          LoginButton(
            isLoading: _isLoading,
            onPressed: _isLoading ? null : _login,
          ),
        ],
      ),
    );
  }
}
