
import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  const LineChartWidget({required this.dailyChart, required this.weeklyChart, required this.maxChart, Key? key}) : super(key: key);
  final DailyChart dailyChart;
  final WeeklyChart weeklyChart;
  final MaxChart maxChart;

  @override
  State<LineChartWidget> createState() {
    return _LineChartWidgetState();
  }
}

class _LineChartWidgetState extends State<LineChartWidget> {
  late ZoomPanBehavior _zoomPanBehavior;
  late TooltipBehavior _tooltipBehavior;
  ChartSeriesController? _chartSeriesController1, _chartSeriesController2, _chartSeriesController3;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enablePanning: true,
        enablePinching: true,
        zoomMode: ZoomMode.x
    );
    _tooltipBehavior = TooltipBehavior(
      enable: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  // height: MediaQuery.of(context).size.height,
                  // alignment: Alignment.center,
                  height: 630,
                    padding: const EdgeInsets.all(8.0),
                    child: SfCartesianChart(
                        zoomPanBehavior: _zoomPanBehavior,
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: NumericAxis(),
                        primaryYAxis: NumericAxis(
                            numberFormat: NumberFormat.simpleCurrency()
                        ),
                        legend: Legend(
                          position: LegendPosition.bottom,
                          title: LegendTitle(
                            text: 'CryptoChart',
                          )
                        ),
                        series: <ChartSeries>[
                          LineSeries<List<double>, double>(
                            name: 'Current Price',
                            dataSource: widget.dailyChart.cryptoChart,
                            xValueMapper: (List<double> chartData, _) => chartData[0],
                            yValueMapper: (List<double> chartData, _) => chartData[1],
                            onRendererCreated: (ChartSeriesController controller){
                              _chartSeriesController1 = controller;
                            },
                            markerSettings: MarkerSettings(
                                isVisible: true
                            ),
                            enableTooltip: true,
                            animationDuration: 4500,
                            animationDelay: 2000,
                          ),
                          LineSeries<List<double>, double>(
                            name: 'Current Price',
                            dataSource: widget.weeklyChart.cryptoChart,
                            xValueMapper: (List<double> chartData, _) => chartData[0],
                            yValueMapper: (List<double> chartData, _) => chartData[1],
                            onRendererCreated: (ChartSeriesController controller){
                              _chartSeriesController2 = controller;
                            },
                            markerSettings: MarkerSettings(
                                isVisible: true
                            ),
                            enableTooltip: true,
                            animationDuration: 4500,
                            animationDelay: 2000,
                          ),
                          LineSeries<List<double>, double>(
                            name: 'Current Price',
                            dataSource: widget.maxChart.cryptoChart,
                            xValueMapper: (List<double> chartData, _) => chartData[0],
                            yValueMapper: (List<double> chartData, _) => chartData[1],
                            onRendererCreated: (ChartSeriesController controller){
                              _chartSeriesController3 = controller;
                            },
                            markerSettings: MarkerSettings(
                                isVisible: true
                            ),
                            enableTooltip: true,
                            animationDuration: 4500,
                            animationDelay: 2000,
                          ),
                        ]
                    ),
                  ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _chartSeriesController1?.animate();
                            },
                            child: Text('Daily'),
                          )),
                      Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _chartSeriesController2?.animate();
                            },
                            child: Text('Weekly'),
                          )),
                      Container(
                          child: ElevatedButton(
                            onPressed: () {
                              _chartSeriesController3?.animate();
                            },
                            child: Text('Max'),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),

        ),

    );
  }
}
