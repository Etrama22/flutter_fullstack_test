import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/pages/users/user_product_detail_page.dart';
import 'package:project_fullstack/widgets/users/product_card.dart';

class AllProduct extends StatelessWidget {
  AllProduct({super.key});

  final List<ProductModel> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.65,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailPage(product: product),
                  ),
                );
              },
              child: ProductCard(product: product),
            );
          },
        ),
      ),
    );
  }
}
