import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/widgets/product/product_carousel.dart';
import 'package:project_fullstack/widgets/product/product_description.dart';
import 'package:project_fullstack/widgets/product/product_detail_info.dart';
import 'package:project_fullstack/widgets/product/product_footer.dart';
import 'package:project_fullstack/widgets/product/product_shipping.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          product.name,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductCarousel(imageUrl: product.imageUrl),
            ProductDetailInfo(
              name: product.name,
              rating: product.rating,
              soldCount: product.soldCount,
            ),
            const SizedBox(height: 8),
            const ProductShipping(),
            const SizedBox(height: 8),
            const ProductDescription(),
          ],
        ),
      ),
      bottomNavigationBar: ProductFooter(
        price: product.price,
        discount: product.discount,
      ),
    );
  }
}
