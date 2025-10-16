import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Produk',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '''Hadirkan nuansa mewah dan elegan di ruang makan Anda dengan Meja Makan Kayu Jati – Ukuran Besar 100m². Terbuat dari kayu jati pilihan yang terkenal kokoh, tahan lama, dan memiliki serat alami yang indah, meja ini tidak hanya berfungsi sebagai tempat makan tetapi juga sebagai investasi furnitur jangka panjang.''',
            style: TextStyle(
              color: Color(0xFF5B5C63),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
