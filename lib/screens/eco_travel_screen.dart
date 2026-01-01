import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class EcoTravelScreen extends StatelessWidget {
  const EcoTravelScreen({super.key});

  final List<Map<String, String>> tips = const [
    {
      'title': 'Use Public Transport',
      'desc': 'Trains and buses reduce carbon emissions by 80%.'
    },
    {
      'title': 'Book Eco-Friendly Hotels',
      'desc': 'Stay in accommodations with green certifications.'
    },
    {
      'title': 'Travel Light',
      'desc': 'Less luggage means less fuel used by planes and cars.'
    },
    {
      'title': 'Walk or Cycle Locally',
      'desc': 'Explore your destination without emissions.'
    },
    {
      'title': 'Offset Carbon Emissions',
      'desc': 'Use apps to offset your flight or trip emissions.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eco Travel Suggestions')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tips.length,
        itemBuilder: (_, i) {
          final t = tips[i];
          return Card(
            child: ListTile(
              leading:
                  const Icon(Icons.directions_bus, color: AppColors.primary),
              title: Text(t['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(t['desc']!),
            ),
          );
        },
      ),
    );
  }
}
