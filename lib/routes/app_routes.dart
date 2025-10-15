import 'package:flutter/material.dart';
import '../pages/admin/auth/login_page.dart';
import '../pages/admin/products/product_list_page.dart';
import '../pages/admin/products/product_add_page.dart';
import '../pages/admin/users/user_list_page.dart';
import '../pages/admin/users/user_add_page.dart';

class AppRoutes {
  static const login = '/login';
  static const productList = '/products';
  static const productAdd = '/products/add';
  static const userList = '/users';
  static const userAdd = '/users/add';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.productList: (context) => const ProductListPage(),
  AppRoutes.productAdd: (context) => const ProductAddPage(),
  AppRoutes.userList: (context) => const UserListPage(),
  AppRoutes.userAdd: (context) => const UserAddPage(),
};
