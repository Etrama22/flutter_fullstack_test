import 'package:flutter/material.dart';

class ProductStatusSwitch extends StatelessWidget {
  final bool isActive;
  final ValueChanged<bool> onChanged;
  final TextEditingController? ambangStokController;

  const ProductStatusSwitch({
    required this.isActive,
    required this.onChanged,
    this.ambangStokController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Status Produk',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF020C1F),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Sistem akan menandai produk sebagai “Menipis” secara otomatis jika stoknya mendekati habis.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5B5C63),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Text(
                    isActive ? 'Aktif' : 'Nonaktif',
                    style: TextStyle(
                      color: const Color(0xFF020C1F),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: isActive,
                    activeThumbColor: Colors.white,
                    activeTrackColor: const Color(0xFFFF7900),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFE6E9EF),
                    onChanged: onChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isActive) ...[
          const SizedBox(height: 16),
          const Text(
            'Produk Menipis',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF020C1F),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: ambangStokController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Masukkan ambang batas stok (mis. 5)',
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE7EAEF)),
              ),
            ),
            style: const TextStyle(
              color: Color(0xFF020C1F),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ],
    );
  }
}
