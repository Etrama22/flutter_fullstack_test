import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/action_button.dart';

class ProductActions extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onRefresh;
  final VoidCallback? onDelete;

  const ProductActions({super.key, this.onEdit, this.onRefresh, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ActionButton(
              label: 'Edit',
              color: const Color(0xFF020C1F),
              borderColor: const Color(0xFFE7EAEF),
              onTap: onEdit,
              icon: PhosphorIconsRegular.pencilSimple,
            ),
            const SizedBox(width: 8),
            ActionButton(
              label: 'Ubah Status',
              color: const Color(0xFF020C1F),
              borderColor: const Color(0xFFE7EAEF),
              onTap: onRefresh,
              icon: PhosphorIconsRegular.arrowsClockwise,
            ),
          ],
        ),
        ActionButton(
          label: 'Hapus',
          color: const Color(0xFFEB2F2F),
          borderColor: const Color(0xFFEB2F2F),
          onTap: onDelete,
          icon: PhosphorIconsRegular.trashSimple,
        ),
      ],
    );
  }
}
