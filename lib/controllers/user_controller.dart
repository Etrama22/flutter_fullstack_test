import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_fullstack/config/app_config.dart';

class UserController {
  final String base = '${AppConfig.apiBase}/users';

  Future<List<Map<String, dynamic>>> getUsers({
    int page = 1,
    int limit = 20,
  }) async {
    final url = Uri.parse('$base/getAll?page=$page&limit=$limit');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      final body = jsonDecode(resp.body);
      final data = body['data'] as List<dynamic>? ?? [];
      return data.map((e) => Map<String, dynamic>.from(e as Map)).toList();
    }
    throw Exception(
      'HTTP request failed, statusCode: ${resp.statusCode}, $url',
    );
  }
}
