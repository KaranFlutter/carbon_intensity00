import 'package:carbon_intensity_project/utils/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CarbonChart extends StatelessWidget {
  CarbonChart({required this.spots});
  final List<FlSpot> spots;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context) * 0.37, // Fixed height for the chart
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: false,
                color: Colors.blueAccent,
                dotData: FlDotData(show: false),
                isStrokeCapRound: false,
                isStrokeJoinRound: false,
              ),
            ],
            gridData: FlGridData(show: true),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.white24),
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: width(context) * 0.1,
                  // textStyle: TextStyle(fontSize: width * 0.03),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  // textStyle: TextStyle(fontSize: width * 0.03),
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  // textStyle: TextStyle(fontSize: width * 0.03),
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  // textStyle: TextStyle(fontSize: width * 0.03),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
