import 'dart:convert';
import 'package:http/http.dart' as http;

class WordPressService {
  final String baseUrl;

  WordPressService({required this.baseUrl});

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/wp-json/wp/v2/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}