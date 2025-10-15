import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductFilterBar extends StatelessWidget {
  const ProductFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(color: Colors.white), // Neutral-50
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Nama Produk',
                    style: TextStyle(
                      color: Color(0xFF050506),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                  Icon(PhosphorIconsRegular.caretDown, size: 16),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            child: Row(
              children: [
                // Red badge
                Container(
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE23F3F),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Color(0xFF050506),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            child: Row(
              children: [
                Icon(PhosphorIconsRegular.arrowsDownUp, size: 16),
                const SizedBox(width: 6),
                const Text(
                  'Asc',
                  style: TextStyle(
                    color: Color(0xFF050506),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
