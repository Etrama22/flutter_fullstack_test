import 'package:flutter/material.dart';

class ProductTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isRequired;
  final TextEditingController? controller;

  const ProductTextField({
    required this.label,
    required this.placeholder,
    this.isRequired = false,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF020C1F),
                ),
              ),
              if (isRequired)
                const Text(
                  '*',
                  style: TextStyle(color: Color(0xFFEB2F2F), fontSize: 14),
                ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: placeholder,
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
      ),
    );
  }
}
