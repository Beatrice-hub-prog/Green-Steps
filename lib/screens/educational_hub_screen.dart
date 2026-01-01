import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../app/app_colors.dart';

class EducationalHubScreen extends StatelessWidget {
  const EducationalHubScreen({super.key});

  final List<Map<String, String>> articles = const [
    {
      'title': '10 Simple Ways to Go Green',
      'snippet': 'Small changes you can do today.'
    },
    {
      'title': 'Understanding Your Carbon Footprint',
      'snippet': 'What contributes the most?'
    },
    {
      'title': 'Sustainable Home Hacks',
      'snippet': 'Tips for reducing household energy.'
    },
    {'title': 'Composting 101', 'snippet': 'Turn waste into useful compost.'},
    {
      'title': 'Eco Labels Explained',
      'snippet': 'Decode the icons on your products.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Educational Hub')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: articles.length,
        itemBuilder: (_, i) {
          final a = articles[i];
          return Card(
            child: ListTile(
              title: Text(a['title']!,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              subtitle: Text(a['snippet']!),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ArticleScreen(
                      title: a['title']!,
                      content:
                          '${a['title']} — full educational content goes here (mock).',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  final String title;
  final String content;
  const ArticleScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.4),
        ),
      ),
    );
  }
}
