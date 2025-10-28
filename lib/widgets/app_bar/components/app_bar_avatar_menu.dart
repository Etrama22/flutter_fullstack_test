import 'package:flutter/material.dart';

class AppBarAvatarMenu extends StatelessWidget {
  final String? resolvedImage;
  final String displayName;
  final bool loggedIn;
  final String? role;
  final ValueChanged<String> onSelected;

  const AppBarAvatarMenu({
    super.key,
    required this.displayName,
    required this.resolvedImage,
    required this.loggedIn,
    required this.onSelected,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final List<PopupMenuEntry<String>> items = [];
        if (!loggedIn) {
          items.add(const PopupMenuItem(value: 'login', child: Text('Login')));
        } else {
          if (role == 'admin') {
            items.add(
              const PopupMenuItem(
                value: 'management',
                child: Text('Management'),
              ),
            );
          }
          items.add(
            const PopupMenuItem(
              value: 'logout',
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }

        final media = MediaQuery.of(context).size;
        final result = await showMenu<String>(
          context: context,
          position: RelativeRect.fromLTRB(
            media.width - 16,
            kToolbarHeight + 40,
            16,
            0,
          ),
          items: items,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.white,
        );

        if (result != null) onSelected(result);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: (resolvedImage != null && resolvedImage!.isNotEmpty)
              ? DecorationImage(
                  image: NetworkImage(resolvedImage!),
                  fit: BoxFit.cover,
                )
              : null,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: (resolvedImage == null || resolvedImage!.isEmpty)
            ? Center(
                child: Text(
                  displayName.isNotEmpty ? displayName[0].toUpperCase() : '',
                  style: const TextStyle(color: Colors.black),
                ),
              )
            : null,
      ),
    );
  }
}
