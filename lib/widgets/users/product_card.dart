import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          Container(
            height: 130,
            width: double.infinity,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: product.image.isNotEmpty
                    ? NetworkImage('http://10.0.2.2:8000${product.image}')
                    : const AssetImage('assets/images/DummyProduct.png')
                          as ImageProvider,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nama,
                  style: const TextStyle(
                    color: Color(0xFF050506),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Rp${product.harga.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: Color(0xFFFF7900),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      product.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Color(0xFF5B5C63),
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFE6E9EF),
                        shape: OvalBorder(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${product.soldCount} Terjual',
                      style: const TextStyle(
                        color: Color(0xFF5B5C63),
                        fontSize: 12,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
