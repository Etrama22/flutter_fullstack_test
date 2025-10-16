import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/admin/custom_search_app_bar.dart';
import 'package:project_fullstack/widgets/admin/product_filter_bar.dart';
import 'package:project_fullstack/widgets/users/all_product.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

      // body: Column(
      //   children: [
      //     const SizedBox(height: 44),
      //     CustomSearchAppBar(
      //       // onUserManagement: () {
      //       //   Navigator.push(
      //       //     context,
      //       //     MaterialPageRoute(builder: (_) => const ()),
      //       //   );
      //       // },
      //     ),
      //     const ProductFilterBar(),
      //     AllProduct(),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomSearchAppBar(
                // onUserManagement: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (_) => const ()),
                //   );
                // },
              ),
              const ProductFilterBar(),
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
