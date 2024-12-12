import 'dart:convert';
import 'package:http/http.dart' as http;

class YouTubeService {
  final String apiKey = 'AIzaSyB4JZnumHRXcl3YwcR-7xIV48xKJQbMwG8'; // Reemplaza con tu clave de API

  // Método para obtener videos de YouTube basados en una categoría
  Future<List<dynamic>> fetchGymVideos(String category) async {
    final url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$category&type=video&key=$apiKey',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
