// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  // For local
  final String baseUrl = "http://10.0.2.2:8000/api/v1/users";

  // For remote
  // final String baseUrl = "http://10.1.31.21:8000/api/v1/users";

  Future<String?> login(String identifier, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"identifier": identifier, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Login success: $data");
        // Simpan token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', data['access_token']);
        return data['data']?['role'];
      } else {
        print("Login failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Login error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }
}
