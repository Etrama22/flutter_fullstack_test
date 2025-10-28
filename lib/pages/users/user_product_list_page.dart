import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:project_fullstack/widgets/app_bar/components/app_bar_menu_item.dart';
import 'package:project_fullstack/widgets/filter/widget_filter_bar_v2.dart';
import 'package:project_fullstack/widgets/users/all_product.dart';
import 'package:project_fullstack/widgets/app_bar/app_bar_custom_search.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCustomSearch(
                hintText: 'Cari produk...',
                menuItems: [
                  AppBarMenuItem(
                    icon: PhosphorIconsBold.usersThree,
                    text: 'Management User',
                    onTap: () {
                      print('User: Management User');
                    },
                  ),
                ],
                controller: TextEditingController(),
              ),
              const WidgetFilterBarV2(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: AllProduct(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
