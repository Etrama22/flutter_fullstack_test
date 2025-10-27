import 'package:flutter/material.dart';
import 'package:project_fullstack/controllers/product_controller.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/widgets/users/product_card.dart';
import 'package:project_fullstack/pages/users/user_product_detail_page.dart'; // ditambahkan

class ProductList extends StatefulWidget {
  final String order;
  final String orderBy;
  final int page;
  final int size;

  const ProductList({
    super.key,
    this.order = 'desc',
    this.orderBy = 'created_at',
    this.page = 1,
    this.size = 50,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController _controller = ProductController();
  List<ProductModel> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => isLoading = true);
    try {
      final result = await _controller.getProducts(
        order: widget.order,
        orderBy: widget.orderBy,
        page: widget.page,
        size: widget.size,
      );
      setState(() {
        products = result;
      });
    } catch (e) {
      setState(() {
        products = [];
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> _refresh() async {
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: isLoading
          ? const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            )
          : products.isEmpty
          ? const SizedBox(
              height: 200,
              child: Center(child: Text('Tidak ada produk')),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final prod = products[index];
                return ProductCard(
                  product: prod,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(product: prod),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
