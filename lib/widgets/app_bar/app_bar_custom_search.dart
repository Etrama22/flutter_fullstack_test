import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/app_bar/components/app_bar_menu.dart';
import 'package:project_fullstack/widgets/app_bar/components/app_bar_menu_item.dart';
import 'package:project_fullstack/widgets/app_bar/components/app_bar_search_field.dart';

class AppBarCustomSearch extends StatefulWidget {
  final String hintText;
  final List<AppBarMenuItem>? menuItems;
  final TextEditingController controller;

  const AppBarCustomSearch({
    super.key,
    this.hintText = 'Cari produk',
    this.menuItems,
    required this.controller,
  });

  @override
  State<AppBarCustomSearch> createState() => _AppBarCustomSearchState();
}

class _AppBarCustomSearchState extends State<AppBarCustomSearch> {
  final GlobalKey _menuKey = GlobalKey();

  void _showMenu() async {
    if (widget.menuItems == null || widget.menuItems!.isEmpty) return;

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
      color: Colors.transparent,
      elevation: 0,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + button.size.height + 4,
        position.dx + 150,
        0,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          value: 'menu',
          child: AppBarMenu(menuItems: widget.menuItems!),
        ),
      ],
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
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SearchField(
              hintText: widget.hintText,
              controller: widget.controller,
            ),
          ),
          const SizedBox(width: 12),
          if (widget.menuItems != null && widget.menuItems!.isNotEmpty)
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
