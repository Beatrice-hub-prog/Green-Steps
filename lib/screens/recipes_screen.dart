import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  final List<Map<String, String>> recipes = const [
    {
      'title': 'Avocado Toast',
      'desc': 'Whole-grain toast with smashed avocado and lime.',
    },
    {
      'title': 'Veggie Stir Fry',
      'desc': 'Mixed vegetables cooked in olive oil and soy sauce.',
    },
    {
      'title': 'Lentil Soup',
      'desc': 'A hearty meal made from lentils and local vegetables.',
    },
    {
      'title': 'Fruit Smoothie Bowl',
      'desc': 'Blended fruits topped with nuts and seeds.',
    },
    {
      'title': 'Plant-Based Pasta',
      'desc': 'Zucchini noodles with tomato and basil sauce.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sustainable Recipes')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: recipes.length,
        itemBuilder: (_, i) {
          final r = recipes[i];
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(r['title']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(r['desc']!),
              trailing:
                  const Icon(Icons.restaurant_menu, color: AppColors.primary),
            ),
          );
        },
      ),
    );
  }
}
