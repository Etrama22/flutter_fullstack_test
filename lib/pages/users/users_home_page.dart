// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project_fullstack/widgets/users/carousel_slider.dart';
import 'package:project_fullstack/widgets/users/custom_app_bar.dart';
import 'package:project_fullstack/widgets/users/product_recommendation.dart';

class UsersHomePage extends StatefulWidget {
  const UsersHomePage({super.key});

  @override
  _UsersHomePageState createState() => _UsersHomePageState();
}

class _UsersHomePageState extends State<UsersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        name: 'Sam',
        imageUrl: 'https://placehold.co/40x40/E6E6FA/000000?text=S',
        onAvatarTap: () {
          print('Avatar diketuk!');
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 260, child: const FurnitureCarousel()),
            ProductRecommendation(),
          ],
        ),
      ),
    );
  }
}
