import 'dart:convert';

class DailyChart {
  DailyChart({
    required this.cryptoChart,
  });

  final List<List<double>> cryptoChart;

  factory DailyChart.fromJson(String str) => DailyChart.fromMap(json.decode(str));

  factory DailyChart.fromMap(Map<String, dynamic> json) => DailyChart(
    cryptoChart: List<List<double>>.from(json["cryptoChart"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
  );

}
