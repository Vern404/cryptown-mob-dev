import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  const Chart({required this.dailyChart, Key? key}) : super(key: key);
  final DailyChart dailyChart;

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  // final List<>

  @override
  void initState() {
    super.initState();
  }

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xffbed0ff),
  ];

  bool showWeekly = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${widget.dailyChart.cryptoChart}'),
        Stack(
          children: <Widget>[
            // Text('${widget.dailyChart}'),
            AspectRatio(
              aspectRatio: 1.70,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  color: Color(0xffbef1ff),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 12,
                    top: 24,
                    bottom: 12,
                  ),
                  child: LineChart(
                    showWeekly ? WeeklyChartData() : DailyChartData(),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 60,
              height: 34,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showWeekly = !showWeekly;
                  });
                },
                child: Text(
                  '14 Days',
                  style: TextStyle(
                    fontSize: 12,
                    color: showWeekly ? Colors.blue.withOpacity(0.5) : Colors
                        .blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  LineChartData DailyChartData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(75, 105, 254, 100),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(75, 105, 254, 100),
            strokeWidth: 1,
          );
        },
      ),

      // titlesData: FlTitlesData(
      //   show: true,
      //   rightTitles: AxisTitles(
      //     sideTitles: SideTitles(showTitles: false),
      //   ),
      //   topTitles: AxisTitles(
      //     sideTitles: SideTitles(showTitles: false),
      //   ),
      //   bottomTitles: AxisTitles(
      //     sideTitles: SideTitles(
      //       showTitles: true,
      //       reservedSize: 30,
      //       interval: 1,
      //       // getTitlesWidget: bottomTitleWidgets,
      //     ),
      //   ),
      //   leftTitles: AxisTitles(
      //     sideTitles: SideTitles(
      //       showTitles: true,
      //       interval: 1,
      //       // getTitlesWidget: leftTitleWidgets,
      //       reservedSize: 42,
      //     ),
      //   ),
      // ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 1667851689000,
      // maxX: 11,
      // minY: 0,
      // maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: widget.dailyChart.cryptoChart.map((data) => FlSpot(data[0], data[1])).toList(),
            // widget.dailyChart.cryptoChart,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }


  LineChartData WeeklyChartData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color.fromRGBO(75, 105, 254, 100),
            strokeWidth: 1,
          );
        },
      ),
      //
      // titlesData: FlTitlesData(
      //   show: true,
      //   rightTitles: AxisTitles(
      //     sideTitles: SideTitles(showTitles: false),
      //   ),
      //   topTitles: AxisTitles(
      //     sideTitles: SideTitles(showTitles: false),
      //   ),
      //   bottomTitles: AxisTitles(
      //     sideTitles: SideTitles(
      //       showTitles: true,
      //       reservedSize: 30,
      //       interval: 1,
      //       // getTitlesWidget: bottomTitleWidgets,
      //     ),
      //   ),
      //   leftTitles: AxisTitles(
      //     sideTitles: SideTitles(
      //       showTitles: true,
      //       interval: 1,
      //       // getTitlesWidget: leftTitleWidgets,
      //       reservedSize: 42,
      //     ),
      //   ),
      // ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 1)
          ] ,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

}