import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: product.image.isNotEmpty
                          ? NetworkImage(
                              'http://10.1.45.93:8000${product.image}',
                            )
                          : const AssetImage('assets/images/DummyProduct.png')
                                as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.nama,
                          style: const TextStyle(
                            color: Color(0xFF050506),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          NumberFormat.currency(
                            locale: 'id_ID',
                            symbol: 'Rp',
                            decimalDigits: 0,
                          ).format(product.harga),
                          style: const TextStyle(
                            color: Color(0xFF050506),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F7FA),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFE6E9EF),
                              ),
                              borderRadius: BorderRadius.circular(99),
                            ),
                          ),
                          child: Text(
                            product.kategori,
                            style: const TextStyle(
                              color: Color(0xFF050506),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Text(
                              'Stok: ',
                              style: TextStyle(
                                color: Color(0xFF5B5C63),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.4,
                              ),
                            ),
                            Text(
                              '${product.stokAwal}',
                              style: const TextStyle(
                                color: Color(0xFF050506),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Row(
                              children: [
                                Icon(
                                  PhosphorIconsFill.checkCircle,
                                  size: 16,
                                  color: const Color(0xFFE6871A),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.status,
                                  style: const TextStyle(
                                    color: Color(0xFFE6871A),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert, size: 20),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _actionButton(
                      label: 'Edit',
                      color: const Color(0xFF020C1F),
                      borderColor: const Color(0xFFE7EAEF),
                      onTap: () {},
                      icon: PhosphorIconsRegular.pencilSimple,
                    ),
                    const SizedBox(width: 8),
                    _actionButton(
                      label: 'Ubah Status',
                      color: const Color(0xFF020C1F),
                      borderColor: const Color(0xFFE7EAEF),
                      onTap: () {},
                      icon: PhosphorIconsRegular.arrowsClockwise,
                    ),
                  ],
                ),
                _actionButton(
                  label: 'Hapus',
                  color: const Color(0xFFEB2F2F),
                  borderColor: const Color(0xFFEB2F2F),
                  onTap: () {},
                  icon: PhosphorIconsRegular.trashSimple,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required Color color,
    required Color borderColor,
    required VoidCallback onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
