import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/admin/product_card.dart';
import 'package:project_fullstack/widgets/admin/product_filter_bar.dart';
import 'package:project_fullstack/widgets/admin/add_product_fab.dart';
import 'package:project_fullstack/widgets/admin/custom_search_app_bar.dart';
import 'package:project_fullstack/pages/admin/admin_user_list_page.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Column(
        children: [
          const SizedBox(height: 44),
          CustomSearchAppBar(
            onUserManagement: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserListPage()),
              );
            },
          ),
          const ProductFilterBar(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              // Menghasilkan daftar ProductCard sebanyak 10 kali
              children: List.generate(10, (index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ProductCard(
                    name: 'Kursi Rotan Hitam',
                    price: 'Rp1.250.000',
                    category: 'Kursi',
                    stock: 8,
                    status: 'Aman',
                    imageUrl: './assets/images/DummyProduct.png',
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: const AddProductFab(),
    );
  }
}
