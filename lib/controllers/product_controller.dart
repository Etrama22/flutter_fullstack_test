import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductController {
  Future<String?> uploadImage(File image) async {
    final url = Uri.parse('http://10.1.45.93:8000/api/v1/upload-image');
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', image.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      final data = jsonDecode(respStr);
      if (data['image'] is String) {
        return data['image'];
      }
    }
    return null;
  }

  Future<http.Response> submitProduct({
    required String nama,
    required String kategori,
    required int stokAwal,
    required int harga,
    required String status,
    required String deskripsi,
    String image = "",
  }) async {
    final url = Uri.parse('http://10.1.45.93:8000/api/v1/products/add');
    final body = {
      "image": image,
      "nama": nama,
      "kategori": kategori,
      "stokAwal": stokAwal,
      "stokPengurangan": 0,
      "stokPenambahan": 0,
      "harga": harga,
      "status": status,
      "deskripsi": deskripsi,
    };

    return await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
  }
}
