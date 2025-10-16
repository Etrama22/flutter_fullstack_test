import 'package:flutter/material.dart';

class ProductShipping extends StatelessWidget {
  const ProductShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.local_shipping_outlined, size: 16),
              SizedBox(width: 8),
              Text(
                'Pengiriman',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF050506),
                ),
              ),
              SizedBox(width: 6),
              Text(
                'Garansi Tiba : ',
                style: TextStyle(fontSize: 14, color: Color(0xFF5B5C63)),
              ),
              Text(
                '4-6 September',
                style: TextStyle(fontSize: 14, color: Color(0xFF5B5C63)),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            'Dapatkan Voucher s/d Rp10.000 jika pesanan terlambat.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF5B5C63),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
