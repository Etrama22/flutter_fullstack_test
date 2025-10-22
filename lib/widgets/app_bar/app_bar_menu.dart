import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/app_bar/app_bar_menu_item.dart';

class AppBarMenu extends StatelessWidget {
  final List<AppBarMenuItem> menuItems;

  const AppBarMenu({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: menuItems.map((item) => _MenuItem(item: item)).toList(),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final AppBarMenuItem item;

  const _MenuItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        item.onTap();
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Icon(item.icon, size: 18, color: const Color(0xFF020C1F)),
            const SizedBox(width: 8),
            Text(
              item.text,
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
}
