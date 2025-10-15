class Product {
  final String imageUrl;
  final String name;
  final String price;
  final String? discount;
  final String rating;
  final String soldCount;

  Product({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.discount,
    required this.rating,
    required this.soldCount,
  });
}
