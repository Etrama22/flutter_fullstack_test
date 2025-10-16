import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/routes/app_routes.dart';
import 'package:project_fullstack/widgets/admin/product_card.dart';
import 'package:project_fullstack/widgets/filter/widget_filter_bar_v2.dart';
import 'package:project_fullstack/widgets/widget_floating_button.dart';
import 'package:project_fullstack/widgets/widget_app_bar.dart';

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
            hintText: 'Cari produk ',
            menuItems: [
              AppBarMenuItem(
                icon: PhosphorIconsBold.usersThree,
                text: 'Management User',
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.userList);
                },
              ),
              AppBarMenuItem(
                icon: PhosphorIconsBold.signOut,
                text: 'Logout',
                onTap: () {
                  print('Admin: Logout');
                },
              ),
            ],
          ),
          const WidgetFilterBarV2(),
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
      floatingActionButton: const WidgetFloatingButton(),
    );
  }
}
