import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class CertificationsScreen extends StatelessWidget {
  const CertificationsScreen({super.key});

  final List<Map<String, String>> guides = const [
    {
      'title': 'Energy Star',
      'desc': 'Certified for energy-efficient appliances and lighting.'
    },
    {
      'title': 'Fair Trade',
      'desc': 'Ensures fair wages and ethical practices for producers.'
    },
    {
      'title': 'USDA Organic',
      'desc': 'Produced without harmful chemicals or GMOs.'
    },
    {
      'title': 'Rainforest Alliance',
      'desc': 'Promotes biodiversity and sustainable farming.'
    },
    {
      'title': 'Recyclable Symbol',
      'desc': 'Indicates materials that can be recycled responsibly.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Green Certifications & Labels')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: guides.length,
        itemBuilder: (_, i) {
          final g = guides[i];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.verified, color: AppColors.primary),
              title: Text(g['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(g['desc']!),
            ),
          );
        },
      ),
    );
  }
}
