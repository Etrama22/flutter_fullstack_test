import 'package:flutter/material.dart';
import 'package:project_fullstack/config/app_config.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProductImage({super.key, required this.imageUrl, this.size = 100});

  @override
  Widget build(BuildContext context) {
    final imageProvider = imageUrl.isNotEmpty
        ? NetworkImage(AppConfig.imageUrl(imageUrl))
        : const AssetImage('assets/images/DummyProduct.png') as ImageProvider;

    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
