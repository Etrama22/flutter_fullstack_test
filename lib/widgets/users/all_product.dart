import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/widgets/users/product_list.dart';

class AllProduct extends StatelessWidget {
  AllProduct({super.key});

  final List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: ProductList(order: 'desc', orderBy: 'created_at', size: 50),
      ),
    );
  }
}
