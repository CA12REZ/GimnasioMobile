import 'dart:convert';
import 'package:http/http.dart' as http;

class TrainingService {
  final String apiUrl = 'https://gimnasio-2-0.onrender.com/ejercicios/';

  Future<List<dynamic>> fetchTrainingData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Error: ${response.statusCode}');
      print('Response: ${response.body}');
      throw Exception('Failed to load training data');
    }
  }
}
