import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvConfig {
  static String get youtubeApiKey => dotenv.env['YOUTUBE_API_KEY'] ?? '';
}
