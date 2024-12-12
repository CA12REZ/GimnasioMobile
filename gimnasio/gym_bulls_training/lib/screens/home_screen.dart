import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/youtube_service.dart';
import '../widgets/video_card.dart';
import '../screens/training_screen.dart'; // Nueva pantalla para Training

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final YouTubeService _youtubeService = YouTubeService();
  List<dynamic> videos = [];
  bool isLoading = true;
  String currentCategory = 'Rutinas'; // Variable para la categoría actual

  @override
  void initState() {
    super.initState();
    fetchVideos(currentCategory); // Cargar videos por defecto al iniciar
  }

  Future<void> fetchVideos(String category) async {
    try {
      final result = await _youtubeService.fetchGymVideos(category);
      setState(() {
        videos = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error fetching videos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Videos'),
        backgroundColor: const Color.fromARGB(255, 146, 10, 1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Gym Videos Menu'),
              decoration: BoxDecoration(
                color: Color.fromARGB(215, 175, 16, 5),
              ),
            ),
            ListTile(
              title: const Text('Rutinas'),
              onTap: () {
                setState(() {
                  currentCategory = 'Rutinas';
                  isLoading = true;
                });
                Navigator.pop(context);
                fetchVideos(currentCategory); // Cargar videos de "Rutinas"
              },
            ),
            ListTile(
              title: const Text('Ejercicios'),
              onTap: () {
                setState(() {
                  currentCategory = 'Ejercicios';
                  isLoading = true;
                });
                Navigator.pop(context);
                fetchVideos(currentCategory); // Cargar videos de "Ejercicios"
              },
            ),
            ListTile(
              title: const Text('Instructores'),
              onTap: () {
                setState(() {
                  currentCategory = 'Instructores';
                  isLoading = true;
                });
                Navigator.pop(context);
                fetchVideos(currentCategory); // Cargar videos de "Instructores"
              },
            ),
            ListTile(
              title: const Text('Training'), // Nueva opción para Training
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrainingScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : videos.isEmpty
              ? const Center(child: Text('No videos available'))
              : ListView.builder(
                  itemCount: videos.length,
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    final thumbnailUrl = video['snippet']['thumbnails']['medium']['url'];
                    final title = video['snippet']['title'];
                    final channelTitle = video['snippet']['channelTitle'];
                    final videoId = video['id']['videoId'];
                    return VideoCard(
                      thumbnailUrl: thumbnailUrl,
                      title: title,
                      channelTitle: channelTitle,
                      onTap: () {
                        final url = 'https://www.youtube.com/watch?v=$videoId';
                        launchURL(url); // Lanza la URL del video
                      },
                    );
                  },
                ),
    );
  }

  // Función para abrir la URL del video
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the video.')),
      );
    }
  }
}
