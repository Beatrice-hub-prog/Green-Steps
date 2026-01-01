import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  final List<Map<String, String>> posts = const [
    {
      'user': 'Sarah',
      'message': 'Just completed my first plastic-free week!',
    },
    {
      'user': 'Daniel',
      'message': 'Planted 5 new trees with my local group 🌳',
    },
    {
      'user': 'Amina',
      'message': 'Loving my new bamboo toothbrushes!',
    },
    {
      'user': 'Leo',
      'message': 'Anyone got ideas for composting indoors?',
    },
    {
      'user': 'Priya',
      'message': 'Started using public transport daily 🚍',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Forum')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (_, i) {
          final p = posts[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            color: Colors.white,
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(p['user']!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(p['message']!),
            ),
          );
        },
      ),
    );
  }
}
