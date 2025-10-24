import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/admin/products/product_create_form.dart';

class ProductAddPage extends StatelessWidget {
  const ProductAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Map?;
    final isEdit = product != null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(isEdit ? "Edit Produk" : "Tambah Produk"),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: const [
          Expanded(child: SingleChildScrollView(child: AddProductForm())),
        ],
      ),
    );
  }
}
