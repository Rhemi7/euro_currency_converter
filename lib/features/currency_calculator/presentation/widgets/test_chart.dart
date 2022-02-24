import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class TestChart extends StatelessWidget {
  const TestChart({
    Key? key,
    required this.gradientColors,
  }) : super(key: key);

  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.20,
      child: SizedBox(
        width: double.infinity,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(),
            gridData: FlGridData(
              show: false,
              drawVerticalLine: false,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: false,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTextStyles: (context, value) =>
                const TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                getTitles: (value) {
                  switch (value.toInt()) {
                  }
                  return '';
                },
                margin: 8,
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (context, value) =>
                const TextStyle(
                  color: Color(0xff67727d),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                getTitles: (value) {
                  switch (value.toInt()) {
                  }
                  return '';
                },
                reservedSize: 28,
                margin: 12,
              ),
            ),
            borderData: FlBorderData(
                show: false,
                border: Border.all(
                    color: const Color(0xff37434d), width: 1)),
            minX: 0,
            maxX: 30,
            minY: 0,
            maxY: 20,
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 3),
                  FlSpot(2.6, 2),
                  FlSpot(4.9, 5),
                  FlSpot(6.8, 3.1),
                  FlSpot(8, 4),
                  FlSpot(9.5, 3),
                  FlSpot(11, 4),
                  FlSpot(12, 5),
                  FlSpot(14, 6),
                  FlSpot(15, 7),
                  FlSpot(16, 8),
                  FlSpot(17, 9),
                  FlSpot(18, 15),
                  FlSpot(19, 12),
                  FlSpot(20, 9),
                  FlSpot(22, 11),
                  FlSpot(23, 12),
                  FlSpot(24, 11),
                  FlSpot(25, 12),
                  FlSpot(27, 12),
                  FlSpot(28, 14),
                  FlSpot(29, 15),
                  FlSpot(30, 18),
                ],
                isCurved: true,
                colors: gradientColors,
                barWidth: 1.5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.2))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
