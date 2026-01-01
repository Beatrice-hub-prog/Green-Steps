import 'package:flutter/material.dart';
import '../widgets/simple_cards.dart';
import 'tracker_screen.dart';
import 'eco_products_screen.dart';
import 'challenges_screen.dart';
import 'waste_tracker_screen.dart';
import 'eco_travel_screen.dart';
import 'recipes_screen.dart';
import 'certifications_screen.dart';
import 'educational_hub_screen.dart';
import 'profile_screen.dart'; // ✅ Added import

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cards = [
      {
        'icon': Icons.track_changes,
        'title': 'Carbon Footprint Tracker',
        'subtitle': 'Track daily habits & emissions',
        'screen': const TrackerScreen(),
      },
      {
        'icon': Icons.shopping_bag,
        'title': 'Eco-Friendly Products',
        'subtitle': 'Shop sustainable & reusable items',
        'screen': const EcoProductsScreen(),
      },
      {
        'icon': Icons.flag,
        'title': 'Sustainable Challenges',
        'subtitle': 'Weekly eco-living goals',
        'screen': const ChallengesScreen(),
      },
      {
        'icon': Icons.delete_sweep_outlined,
        'title': 'Waste Reduction Tracker',
        'subtitle': 'Track your recycling & compost',
        'screen': const WasteTrackerScreen(),
      },
      {
        'icon': Icons.travel_explore,
        'title': 'Eco Travel',
        'subtitle': 'Discover greener travel options',
        'screen': const EcoTravelScreen(),
      },
      {
        'icon': Icons.restaurant_menu,
        'title': 'Sustainable Recipes',
        'subtitle': 'Plan healthy eco-friendly meals',
        'screen': const RecipesScreen(),
      },
      {
        'icon': Icons.verified,
        'title': 'Certifications & Labels',
        'subtitle': 'Learn about eco product standards',
        'screen': const CertificationsScreen(),
      },
      {
        'icon': Icons.menu_book,
        'title': 'Educational Hub',
        'subtitle': 'Articles & environmental tips',
        'screen': const EducationalHubScreen(),
      },
      {
        'icon': Icons.person,
        'title': 'Profile & Support',
        'subtitle': 'About us, Contact form, and profile settings',
        'screen': const ProfileScreen(), // ✅ Added Profile section
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('GreenSteps Home'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final c = cards[index];
          return SimpleCard(
            icon: c['icon'],
            title: c['title'],
            subtitle: c['subtitle'],
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => c['screen']),
            ),
          );
        },
      ),
    );
  }
}
