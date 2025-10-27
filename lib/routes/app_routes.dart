import 'package:flutter/material.dart';
import 'package:project_fullstack/pages/home_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/admin/admin_product_list_page.dart';
import '../pages/admin/admin_product_add_page.dart';
import '../pages/admin/admin_user_list_page.dart';
import '../pages/admin/admin_user_add_page.dart';

class AppRoutes {
  static const login = '/login';
  static const productList = '/products';
  static const productAdd = '/products/add';
  static const userList = '/users';
  static const userAdd = '/users/add';
  static const home = '/home';
}

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.login: (context) => const LoginPage(),
  AppRoutes.productList: (context) => const AdminProductListPage(),
  AppRoutes.productAdd: (context) => const ProductAddPage(),
  AppRoutes.userList: (context) => const AdminUserListPage(),
  AppRoutes.userAdd: (context) => const UserAddPage(),
  AppRoutes.home: (context) => const UsersHomePage(),
};
