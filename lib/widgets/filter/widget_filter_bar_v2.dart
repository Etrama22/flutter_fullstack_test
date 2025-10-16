import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WidgetFilterBarV2 extends StatefulWidget {
  const WidgetFilterBarV2({super.key});

  @override
  State<WidgetFilterBarV2> createState() => _WidgetFilterBarV2State();
}

class _WidgetFilterBarV2State extends State<WidgetFilterBarV2> {
  String selectedFilter = 'Nama Produk';
  String sortOrder = 'Asc';
  int activeFilters = 2; // contoh badge merah

  final List<String> filters = [
    'Nama Produk',
    'Harga Produk',
    'Kategori',
    'Status',
  ];

  void toggleSortOrder() {
    setState(() {
      sortOrder = sortOrder == 'Asc' ? 'Desc' : 'Asc';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isDense: true,
                  value: selectedFilter,
                  icon: Icon(
                    PhosphorIconsRegular.caretDown,
                    size: 16,
                    color: const Color(0xFF050506),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: filters.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          GestureDetector(
            // onTap: () {
            //   toggleSortOrder();
            // },
            child: Container(
              height: 40,
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
                  if (activeFilters > 0)
                    Container(
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE23F3F),
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: Text(
                        activeFilters.toString(),
                        style: const TextStyle(
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
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Sort Toggle
          GestureDetector(
            onTap: toggleSortOrder,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    PhosphorIconsRegular.arrowsDownUp,
                    size: 16,
                    color: const Color(0xFF050506),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    sortOrder,
                    style: const TextStyle(
                      color: Color(0xFF050506),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
