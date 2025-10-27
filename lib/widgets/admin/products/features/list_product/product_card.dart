import 'package:flutter/material.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/controllers/product_controller.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/product_image.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/product_info.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/product_actions.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/delete_dialog.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/progress_dialog.dart';
import 'package:project_fullstack/widgets/admin/products/features/list_product/components/toast_overlay.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onDeleted;

  const ProductCard({super.key, required this.product, this.onDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(imageUrl: product.image, size: 100),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ProductInfo(product: product),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert, size: 20),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
            child: ProductActions(
              onEdit: () {},
              onRefresh: () {},
              onDelete: () => _confirmDelete(context),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context) async {
    final confirm = await DeleteDialog.show(context);
    if (confirm != true) return;

    ProgressDialog.show(context, text: 'Menghapus...');

    final controller = ProductController();
    bool success = false;
    try {
      success = await controller.deleteProduct(product.id.toString());
    } catch (_) {
      success = false;
    } finally {
      try {
        if (Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      } catch (_) {}
    }

    await ToastOverlay.show(
      context,
      success: success,
      message: success ? 'Produk berhasil dihapus' : 'Gagal menghapus produk',
    );

    if (success && onDeleted != null) onDeleted!();
  }
}
