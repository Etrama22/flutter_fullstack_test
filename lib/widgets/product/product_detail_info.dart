import 'package:flutter/material.dart';

class ProductDetailInfo extends StatelessWidget {
  final String name;
  final String rating;
  final String soldCount;

  const ProductDetailInfo({
    super.key,
    required this.name,
    required this.rating,
    required this.soldCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.orange),
              const SizedBox(width: 4),
              Text(
                rating,
                style: const TextStyle(fontSize: 12, color: Color(0xFF050506)),
              ),
              const SizedBox(width: 8),
              const CircleAvatar(radius: 2, backgroundColor: Color(0xFFE6E9EF)),
              const SizedBox(width: 8),
              Text(
                '$soldCount Terjual',
                style: const TextStyle(fontSize: 12, color: Color(0xFF050506)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
