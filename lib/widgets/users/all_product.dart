import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/pages/users/user_product_detail_page.dart';
import 'package:project_fullstack/widgets/users/product_card.dart';

class AllProduct extends StatelessWidget {
  AllProduct({super.key});

  final List<Product> products = [
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1533090481720-856c6e3c1fdc?w=500',
      name: 'Meja Makan Kayu Jati - Ukuran besar',
      price: 'Rp 3.400.000',
      discount: '-12',
      rating: '4.9',
      soldCount: '121',
    ),
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=500',
      name: 'Sofa Minimalis - 3 Dudukan Empuk',
      price: 'Rp 5.000.000',
      discount: '-5',
      rating: '4.9',
      soldCount: '250',
    ),
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=500',
      name: 'Kursi Santai Rotan - Desain ergonomis',
      price: 'Rp 1.200.000',
      discount: '-10',
      rating: '4.8',
      soldCount: '312',
    ),
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1567016432779-1fee74948a47?w=500',
      name: 'Rak Dinding Modern - Minimalis',
      price: 'Rp 350.000',
      rating: '4.9',
      soldCount: '500+',
    ),
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1558211583-d26b50c60134?w=500',
      name: 'Lampu Tidur Aesthetic - Warm White',
      price: 'Rp 120.000',
      discount: '-15',
      rating: '4.7',
      soldCount: '142',
    ),
    Product(
      imageUrl:
          'https://images.unsplash.com/photo-1567016432779-1fee74948a47?w=500',
      name: 'Rak Buku Gantung - Industrial Style',
      price: 'Rp 450.000',
      rating: '4.8',
      soldCount: '330',
    ),
  ];

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
