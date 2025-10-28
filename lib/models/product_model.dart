class ProductModel {
  final String id;
  final String image;
  final String nama;
  final String kategori;
  final int stokAwal;
  final int stokPengurangan;
  final int stokPenambahan;
  final double harga;
  final String status;
  final String deskripsi;
  final double rating;

  ProductModel({
    required this.id,
    required this.image,
    required this.nama,
    required this.kategori,
    required this.stokAwal,
    required this.stokPengurangan,
    required this.stokPenambahan,
    required this.harga,
    required this.status,
    required this.deskripsi,
    this.rating = 0.0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? '',
      image: json['image'] ?? '',
      nama: json['nama'] ?? '',
      kategori: json['kategori'] ?? '',
      stokAwal: (json['stokAwal'] ?? 0).toInt(),
      stokPengurangan: (json['stokPengurangan'] ?? 0).toInt(),
      stokPenambahan: (json['stokPenambahan'] ?? 0).toInt(),
      harga: (json['harga'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}
