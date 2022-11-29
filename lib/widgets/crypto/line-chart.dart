
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

  bool _isDailyOffstage = true;
  void showDaily(){
    setState(() {
      _isDailyOffstage = !_isDailyOffstage;
      _isWeeklyOffstage = true;
      _isMaxOffstage = true;
    });
  }
  bool _isWeeklyOffstage = true;
  void showWeekly(){
    setState(() {
      _isWeeklyOffstage = !_isWeeklyOffstage;
      _isDailyOffstage = true;
      _isMaxOffstage = true;
    });
  }

  bool _isMaxOffstage = false;
  void showMax(){
    setState(() {
      _isMaxOffstage = !_isMaxOffstage;
      _isDailyOffstage = true;
      _isWeeklyOffstage = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          child: ElevatedButton(
                            onPressed: showDaily,
                            child: Text('Daily'),
                          )),
                      Container(
                          child: ElevatedButton(
                            onPressed:showWeekly,
                            child: Text('Weekly'),
                          )),
                      Container(
                          child: ElevatedButton(
                            onPressed:showMax,
                            child: Text('Max'),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Offstage(
                  offstage: _isDailyOffstage,
                  child: Column(
                    children: [
                      Text('Daily Chart'),
                      const SizedBox(height: 10),
                      Container(
                        height: 600,
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
                    ],
                  ),
                ),
                Offstage(
                  offstage: _isWeeklyOffstage,
                  child: Column(
                    children: [
                      Text('Weekly Chart'),
                      const SizedBox(height: 10),
                      Container(
                        height: 600,
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
                                dataSource: widget.weeklyChart.cryptoChart,
                                xValueMapper: (List<double> chartData, _) => chartData[0],
                                yValueMapper: (List<double> chartData, _) => chartData[1],
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
                    ],
                  ),
                ),
                Offstage(
                  offstage: _isMaxOffstage,
                  child: Column(
                    children: [
                      Text('Max Chart'),
                      const SizedBox(height: 10),
                      Container(
                        height: 600,
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
                                dataSource: widget.maxChart.cryptoChart,
                                xValueMapper: (List<double> chartData, _) => chartData[0],
                                yValueMapper: (List<double> chartData, _) => chartData[1],
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
