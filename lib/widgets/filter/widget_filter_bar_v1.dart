import 'package:flutter/material.dart';

class WidgetFilterBarV1 extends StatefulWidget {
  const WidgetFilterBarV1({super.key});

  @override
  State<WidgetFilterBarV1> createState() => _WidgetFilterBarV1State();
}

class _WidgetFilterBarV1State extends State<WidgetFilterBarV1> {
  String selectedFilter = 'Status';
  String sortOrder = 'Asc';

  final List<String> filters = ['Nama', 'Status'];

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
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedFilter,
                  icon: const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Color(0xFF050506),
                  ),
                  style: const TextStyle(
                    color: Color(0xFF050506),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedFilter = newValue!;
                    });
                  },
                  items: filters.map<DropdownMenuItem<String>>((String value) {
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
            onTap: toggleSortOrder,
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.swap_vert_rounded,
                    size: 16,
                    color: Color(0xFF050506),
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
