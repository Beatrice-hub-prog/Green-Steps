import 'package:flutter/material.dart';
import '../app/app_colors.dart';

class WasteTrackerScreen extends StatefulWidget {
  const WasteTrackerScreen({super.key});

  @override
  State<WasteTrackerScreen> createState() => _WasteTrackerScreenState();
}

class _WasteTrackerScreenState extends State<WasteTrackerScreen> {
  int recycled = 0;
  int composted = 0;
  int plasticReduced = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Waste Reduction Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCounter('Recycled Items', recycled, Icons.recycling),
            _buildCounter('Composted Waste', composted, Icons.grass),
            _buildCounter(
                'Plastic Items Avoided', plasticReduced, Icons.delete_outline),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              onPressed: () {
                setState(() {
                  recycled = 0;
                  composted = 0;
                  plasticReduced = 0;
                });
              },
              child: const Text('Reset Tracker'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCounter(String label, int value, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [
          IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                if (value > 0) {
                  setState(() {
                    if (label.contains('Recycle')) recycled--;
                    if (label.contains('Compost')) composted--;
                    if (label.contains('Plastic')) plasticReduced--;
                  });
                }
              }),
          Text(value.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                setState(() {
                  if (label.contains('Recycle')) recycled++;
                  if (label.contains('Compost')) composted++;
                  if (label.contains('Plastic')) plasticReduced++;
                });
              }),
        ]),
      ),
    );
  }
}
