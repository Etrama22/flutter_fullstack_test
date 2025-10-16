class DummyProductModel {
  final int id;
  final String name;
  final String price;
  final String imageUrl;

  DummyProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory DummyProductModel.fromJson(Map<String, dynamic> json) {
    return DummyProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
