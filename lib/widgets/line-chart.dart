//
// import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class LineChart extends StatefulWidget {
//   const LineChart({required this.dailyChart}) : super(key: key);
//   final DailyChart dailyChart;
//
//   @override
//   State<LineChart> createState() => _LineChartState();
// }
//
// class _LineChartState extends State<LineChart> {
//
//   // List <dailyChart> _chartData;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body:SfCartesianChart(
//           primaryXAxis: CategoryAxis(),
//
//           series: <LineSeries<SalesData, String>>[
//             LineSeries<SalesData, String>(
//               // Bind data source
//                 dataSource:  <SalesData>[
//                   SalesData('Jan', 35),
//                   SalesData('Feb', 28),
//                   SalesData('Mar', 34),
//                   SalesData('Apr', 32),
//                   SalesData('May', 40)
//                 ],
//               xValueMapper: (SalesData sales, _) => sales.year,
//               yValueMapper: (SalesData sales, _) => sales.sales)
//         ]
//       ),
//     ));
//
//   }
//
//   class SalesData {
//   SalesData(this.year, this.sales);
//   final String year;
//   final double sales;
//   }
//   // List<dailyChart> getChartData(DailyChart data){
//   //   final List<dailyChart> chartData =
//   // return chartData;
//   // }
// }
