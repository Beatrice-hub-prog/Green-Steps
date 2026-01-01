import 'package:flutter/material.dart';
import '../app/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  final List<Map<String, String>> products = const [
    {
      'title': 'Reusable Water Bottle',
      'desc': '1L stainless steel bottle',
      'category': 'Lifestyle'
    },
    {
      'title': 'Bamboo Toothbrush',
      'desc': 'Biodegradable bamboo handle',
      'category': 'Personal Care'
    },
    {
      'title': 'Organic Cotton Tote',
      'desc': 'Replace plastic bags',
      'category': 'Lifestyle'
    },
    {'title': 'LED Bulb', 'desc': 'Energy-saving 9W LED', 'category': 'Home'},
    {
      'title': 'Compost Bin',
      'desc': 'Indoor compost starter kit',
      'category': 'Home'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Eco-Friendly Products')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: products.length,
        itemBuilder: (context, i) {
          final p = products[i];
          return Card(
            child: ListTile(
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag_outlined,
                    color: Colors.white),
              ),
              title: Text(p['title']!,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
              subtitle: Text('${p['desc']} • ${p['category']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${p['title']} saved to wishlist')),
                  );
                },
                child: const Text('Save'),
              ),
            ),
          );
        },
      ),
    );
  }
}
