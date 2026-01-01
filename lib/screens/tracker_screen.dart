import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app/app_state.dart';

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final _form = GlobalKey<FormState>();
  final carCtrl = TextEditingController();
  final elecCtrl = TextEditingController();
  final mealCtrl = TextEditingController();

  double _estimate(double km, double kwh, double meatMeals) =>
      km * 0.21 + kwh * 0.5 + meatMeals * 2.5;

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) return;
    final km = double.tryParse(carCtrl.text) ?? 0;
    final kwh = double.tryParse(elecCtrl.text) ?? 0;
    final meals = double.tryParse(mealCtrl.text) ?? 0;
    final total = _estimate(km, kwh, meals);

    await Provider.of<AppState>(context, listen: false).addTrackerEntry({
      'transportKm': km,
      'electricityKwh': kwh,
      'meatMeals': meals,
      'totalCo2': total,
      'date': DateTime.now().toIso8601String(),
    });

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Result'),
        content: Text('Estimated CO₂: ${total.toStringAsFixed(2)} kg'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('OK'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Carbon Footprint Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Form(
              key: _form,
              child: Column(children: [
                TextFormField(
                  controller: carCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Km by car today'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter a value' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: elecCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Electricity (kWh)'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter a value' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: mealCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Meat-based meals'),
                  keyboardType: TextInputType.number,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Enter a value' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: _submit, child: const Text('Calculate')),
              ]),
            ),
            const SizedBox(height: 20),
            Text('History',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            ...app.trackerEntries.map((e) {
              final date = DateTime.parse(e['date']);
              return Card(
                child: ListTile(
                  title: Text('${e['totalCo2'].toStringAsFixed(2)} kg CO₂'),
                  subtitle: Text(date.toLocal().toString().split('.').first),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
