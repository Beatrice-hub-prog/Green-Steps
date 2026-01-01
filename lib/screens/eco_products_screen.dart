import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class EcoProductsScreen extends StatelessWidget {
  const EcoProductsScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'name': 'Reusable Water Bottle',
      'desc': 'Made from recycled stainless steel, BPA-free.',
      'price': '\$15',
    },
    {
      'name': 'Organic Cotton Tote Bag',
      'desc': 'Perfect replacement for single-use plastic bags.',
      'price': '\$10',
    },
    {
      'name': 'Solar Powered Charger',
      'desc': 'Charge your phone with renewable energy.',
      'price': '\$25',
    },
    {
      'name': 'Bamboo Toothbrush Set',
      'desc': 'Eco-friendly and biodegradable bristles.',
      'price': '\$8',
    },
    {
      'name': 'Compostable Food Containers',
      'desc': 'Durable and earth-safe takeout boxes.',
      'price': '\$12',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eco-Friendly Products')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (_, i) {
          final p = products[i];
          return Card(
            color: Colors.white,
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(p['name']!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(p['desc']!),
              trailing: Text(p['price']!,
                  style: const TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.w600)),
            ),
          );
        },
      ),
    );
  }
}
