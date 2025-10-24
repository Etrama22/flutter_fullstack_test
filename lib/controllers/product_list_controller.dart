import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_fullstack/models/product_model.dart';

class ProductService {
  static Future<List<ProductModel>> getProducts({
    String order = 'desc',
    String orderBy = 'created_at',
    int page = 1,
    int size = 10,
  }) async {
    final url = Uri.parse(
      // Base Url for local development
      // 'http://10.0.2.2:8000/api/v1/products/getAll?order=$order&orderBy=$orderBy&page=$page&size=$size',

      // Base Url for remote development
      'http://10.1.45.93:8000/api/v1/products/getAll?order=$order&orderBy=$orderBy&page=$page&size=$size',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> body = jsonDecode(response.body);
      final List<dynamic> data = body['data'];
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat produk (${response.statusCode})');
    }
  }
}
