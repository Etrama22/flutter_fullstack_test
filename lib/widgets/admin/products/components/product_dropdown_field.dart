import 'package:flutter/material.dart';

class ProductDropdownField extends StatelessWidget {
  final String label;
  final String placeholder;
  final bool isRequired;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  const ProductDropdownField({
    required this.label,
    required this.placeholder,
    this.isRequired = false,
    required this.value,
    required this.items,
    required this.onChanged,
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
          Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE7EAEF)),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value.isEmpty ? null : value,
                hint: Text(
                  placeholder,
                  style: const TextStyle(
                    color: Color(0xFF7C828C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF5B5C63),
                  size: 20,
                ),
                style: const TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                items: items
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e[0].toUpperCase() + e.substring(1)),
                      ),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) onChanged(val);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
