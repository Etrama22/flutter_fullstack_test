import 'package:flutter/material.dart';

class UserFilterBar extends StatelessWidget {
  const UserFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 12),
      decoration: const BoxDecoration(
        color: Colors.white, // Neutral-50
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Filter Status
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFE6E9EF), // Border-Primary
                  ),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Status',
                    style: TextStyle(
                      color: Color(0xFF050506), // Font-Primary
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    size: 20,
                    color: Color(0xFF050506),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Filter Asc/Desc
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFE6E9EF), // Border-Primary
                ),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.swap_vert_rounded,
                  size: 16,
                  color: Color(0xFF050506),
                ),
                SizedBox(width: 6),
                Text(
                  'Asc',
                  style: TextStyle(
                    color: Color(0xFF050506), // Font-Primary
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
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
