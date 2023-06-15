import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl =
      'http://your-api-url.com'; // Ganti dengan URL API Anda

  // Mendapatkan data dari server MySQL
  static Future<List<dynamic>> getData() async {
    final response = await http.get(Uri.parse('$apiUrl/get_data.php'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Menambahkan data baru ke server MySQL
  static Future<void> addData(String name, String email) async {
    final response = await http.post(Uri.parse('$apiUrl/add_data.php'), body: {
      'name': name,
      'email': email,
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to add data');
    }
  }

  // Mengedit data di server MySQL
  static Future<void> editData(int id, String name, String email) async {
    final response = await http.post(Uri.parse('$apiUrl/edit_data.php'), body: {
      'id': id.toString(),
      'name': name,
      'email': email,
    });

    if (response.statusCode != 200) {
      throw Exception('Failed to edit data');
    }
  }
}
