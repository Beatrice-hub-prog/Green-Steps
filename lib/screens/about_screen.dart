import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About GreenSteps')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About GreenSteps',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              SizedBox(height: 12),
              Text(
                'GreenSteps is a mobile app prototype built to help users adopt sustainable living habits. It empowers individuals to track their carbon footprint, explore eco-friendly products, join community challenges, and learn from educational resources — all in one platform.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                'Mission',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              SizedBox(height: 6),
              Text(
                'To create awareness and inspire sustainable lifestyles by simplifying access to eco-friendly choices and community support.',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 16),
              Text(
                'Vision',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              SizedBox(height: 6),
              Text(
                'A greener planet where individuals and communities thrive sustainably through conscious living.',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
