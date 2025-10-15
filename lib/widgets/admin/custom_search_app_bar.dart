// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomSearchAppBar extends StatefulWidget {
  final String hintText;
  final VoidCallback? onUserManagement;

  const CustomSearchAppBar({
    super.key,
    this.hintText = 'Cari produk',
    this.onUserManagement,
  });

  @override
  State<CustomSearchAppBar> createState() => _CustomSearchAppBarState();
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  final GlobalKey _menuKey = GlobalKey();

  void _showMenu() async {
    final RenderBox button =
        _menuKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Offset position = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );

    await showMenu(
      context: context,
      color: Colors.transparent, // ⬅️ Biar background transparan
      elevation: 0, // ⬅️ Hilangin shadow default
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height + 4, // sedikit jarak biar rapi
        position.dx + 150,
        0,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 'user_management',
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _menuItem(
                  icon: PhosphorIconsBold.usersThree,
                  text: 'Management User',
                  onTap: () => widget.onUserManagement?.call(),
                ),
                // _menuItem(
                //   icon: PhosphorIconsBold.gear,
                //   text: 'Pengaturan',
                //   onTap: () {
                //     // Contoh action lain
                //   },
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF020C1F)),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF020C1F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            offset: Offset(0, 5),
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFE6E9EF)),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 18, color: Color(0xFF5B5C63)),
                  const SizedBox(width: 8),
                  Text(
                    widget.hintText,
                    style: const TextStyle(
                      color: Color(0xFF5B5C63),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 12),

          GestureDetector(
            key: _menuKey,
            onTap: _showMenu,
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: const Icon(Icons.more_vert, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
