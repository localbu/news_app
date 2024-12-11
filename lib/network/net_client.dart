import 'dart:convert';
import 'package:api_vidio/models/respose_news.dart';
import 'package:http/http.dart' as http;

class NetClient {
  // Main URL
  final String url = 'https://berita-indo-api-next.vercel.app/api/';

  Future<ResposeNews> fetchNews({required String newsEndpoint}) async {
    try {
      // Build URI
      final Uri uri = Uri.parse(url).resolve(newsEndpoint);

      // Send GET request
      final response = await http.get(uri);

      // Check response status
      if (response.statusCode == 200) {
        // Decode and return the news
        return ResposeNews.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      // Throw detailed error
      throw Exception("Cannot fetch news. Error: $e");
    }
  }
}
