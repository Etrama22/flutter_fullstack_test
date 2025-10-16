import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../pages/admin/admin_product_add_page.dart'; // pastiin path ini bener

class AddProductFab extends StatelessWidget {
  const AddProductFab({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductAddPage()),
        );
      },
      backgroundColor: const Color(0xFFFF7900),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
      child: const Icon(
        PhosphorIconsRegular.plus,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
