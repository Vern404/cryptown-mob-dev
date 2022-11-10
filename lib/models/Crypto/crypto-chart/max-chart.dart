import 'dart:convert';

class MaxChart {
  MaxChart({
    required this.cryptoChart,
  });

  final List<List<double>> cryptoChart;

  factory MaxChart.fromJson(String str) => MaxChart.fromMap(json.decode(str));

  factory MaxChart.fromMap(Map<String, dynamic> json) => MaxChart(
    cryptoChart: List<List<double>>.from(json["cryptoChart"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
  );

}
