import 'dart:convert';

class WeeklyChart {
  WeeklyChart({
    required this.cryptoChart,
  });

  final List<List<double>> cryptoChart;

  factory WeeklyChart.fromJson(String str) => WeeklyChart.fromMap(json.decode(str));

  factory WeeklyChart.fromMap(Map<String, dynamic> json) => WeeklyChart(
    cryptoChart: List<List<double>>.from(json["cryptoChart"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
  );
}
