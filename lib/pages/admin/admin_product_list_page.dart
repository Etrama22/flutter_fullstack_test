import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/controllers/product_list_controller.dart';
import 'package:project_fullstack/models/product_model.dart';
import 'package:project_fullstack/routes/app_routes.dart';
import 'package:project_fullstack/widgets/filter/widget_filter_bar_v2.dart';
import 'package:project_fullstack/widgets/admin/product_card.dart';
import 'package:project_fullstack/widgets/widget_app_bar.dart';
import 'package:project_fullstack/widgets/widget_floating_button.dart';

class AdminProductListPage extends StatefulWidget {
  const AdminProductListPage({super.key});

  @override
  State<AdminProductListPage> createState() => _AdminProductListPageState();
}

class _AdminProductListPageState extends State<AdminProductListPage> {
  List<ProductModel> products = [];
  bool isLoading = true;
  String selectedOrder = 'desc';
  String selectedFilter = 'created_at';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() => isLoading = true);
    try {
      final result = await ProductService.getProducts(
        order: selectedOrder,
        orderBy: selectedFilter,
      );
      setState(() {
        products = result;
      });
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _onFilterChange(String filter) {
    setState(() {
      selectedFilter = filter == 'Nama Produk'
          ? 'nama'
          : filter == 'Harga Produk'
          ? 'harga'
          : filter == 'Kategori'
          ? 'kategori'
          : 'status';
    });
    _loadProducts();
  }

  void _onSortChange(String order) {
    setState(() {
      selectedOrder = order.toLowerCase();
    });
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          const SizedBox(height: 44),
          CustomSearchAppBar(
            hintText: 'Cari produk...',
            menuItems: [
              AppBarMenuItem(
                icon: PhosphorIconsBold.usersThree,
                text: 'Management User',
                onTap: () => Navigator.pushNamed(context, AppRoutes.userList),
              ),
              AppBarMenuItem(
                icon: PhosphorIconsBold.signOut,
                text: 'Logout',
                onTap: () => print('Logout pressed'),
              ),
            ],
          ),
          WidgetFilterBarV2(
            onFilterChange: _onFilterChange,
            onSortChange: _onSortChange,
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _loadProducts,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final p = products[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ProductCard(product: p),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: const WidgetFloatingButton(),
    );
  }
}
