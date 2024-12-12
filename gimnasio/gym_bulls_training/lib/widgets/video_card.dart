import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String channelTitle;
  final VoidCallback onTap;

  const VideoCard({
    Key? key,
    required this.thumbnailUrl,
    required this.title,
    required this.channelTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Image.network(thumbnailUrl, width: 80.0, height: 80.0),
        title: Text(title),
        subtitle: Text(channelTitle),
        onTap: onTap,
      ),
    );
  }
}
