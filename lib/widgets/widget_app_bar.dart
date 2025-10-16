import 'package:flutter/material.dart';

class AppBarMenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  AppBarMenuItem({required this.icon, required this.text, required this.onTap});
}

class CustomSearchAppBar extends StatefulWidget {
  final String hintText;
  final List<AppBarMenuItem>? menuItems;

  const CustomSearchAppBar({
    super.key,
    this.hintText = 'Cari produk',
    this.menuItems,
  });

  @override
  State<CustomSearchAppBar> createState() => _CustomSearchAppBarState();
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
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
              mainAxisSize: MainAxisSize.min,
              children: widget.menuItems!
                  .map(
                    (item) => InkWell(
                      onTap: item.onTap,
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 18,
                              color: const Color(0xFF020C1F),
                            ),
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
                    ),
                  )
                  .toList(),
            ),
          ),
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
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF5B5C63),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 18,
                  color: Color(0xFF5B5C63),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6E9EF),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6E9EF),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(99),
                  borderSide: const BorderSide(
                    color: Color(0xFFE6E9EF),
                    width: 1,
                  ),
                ),
              ),
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
