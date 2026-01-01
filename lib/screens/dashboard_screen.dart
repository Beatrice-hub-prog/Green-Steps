import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';
import '../app/app_state.dart';
import '../app/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppState>(context);
    final entries = app.trackerEntries.take(7).toList().reversed.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Progress Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: entries.isEmpty
            ? const Center(child: Text('No data yet. Add tracker entries.'))
            : BarChart(
                BarChartData(
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: true)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (v, _) {
                          final i = v.toInt();
                          if (i < 0 || i >= entries.length) {
                            return const SizedBox();
                          }
                          final date = DateTime.parse(entries[i]['date']);
                          return Text('${date.day}/${date.month}');
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(entries.length, (i) {
                    final e = entries[i];
                    return BarChartGroupData(x: i, barRods: [
                      BarChartRodData(
                          toY: e['totalCo2'] ?? 0, color: AppColors.primary)
                    ]);
                  }),
                ),
              ),
      ),
    );
  }
}
