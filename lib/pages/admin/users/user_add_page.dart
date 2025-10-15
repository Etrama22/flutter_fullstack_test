import 'package:flutter/material.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah User"),
        backgroundColor: Colors.indigo,
      ),
      body: const Center(child: Text("Form Tambah User (coming soon)")),
    );
  }
}
