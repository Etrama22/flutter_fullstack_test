import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/pages/users/user_product_list_page.dart';
import 'package:project_fullstack/widgets/users/product_card.dart';

class ProductRecommendation extends StatelessWidget {
  final List<ProductModel> products = [];

  ProductRecommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rekomendasi',
                  style: TextStyle(
                    color: Color(0xFF050506),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Produk - produk pilihan terbaik dari kami',
                  style: TextStyle(
                    color: Color(0xFF5B5C63),
                    fontSize: 12,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),

          GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Color(0xFFE7EAEF)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductListPage()),
                );
              },
              child: const Text(
                'Lihat Semua Produk',
                style: TextStyle(
                  color: Color(0xFF020C1F),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
