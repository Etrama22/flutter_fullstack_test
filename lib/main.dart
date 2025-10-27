import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture Ecommerce',
      initialRoute: AppRoutes.home,
      routes: appRoutes,
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
