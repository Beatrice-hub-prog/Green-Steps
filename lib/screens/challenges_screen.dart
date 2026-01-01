import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  final List<Map<String, String>> challenges = const [
    {
      'title': 'Plastic-Free Week',
      'desc': 'Avoid using any single-use plastic items for one week.'
    },
    {
      'title': 'Car-Free Day',
      'desc': 'Use only public transport, cycling, or walking today.'
    },
    {
      'title': 'Energy Saver Challenge',
      'desc': 'Turn off unused lights and appliances for 3 days.'
    },
    {
      'title': 'Zero Food Waste',
      'desc': 'Plan your meals to reduce leftovers for 5 days.'
    },
    {
      'title': 'Sustainable Wardrobe',
      'desc': 'Buy nothing new — reuse or thrift your clothes this week.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sustainable Challenges')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: challenges.length,
        itemBuilder: (_, i) {
          final c = challenges[i];
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(c['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(c['desc']!),
              trailing: const Icon(Icons.check_circle_outline,
                  color: AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
