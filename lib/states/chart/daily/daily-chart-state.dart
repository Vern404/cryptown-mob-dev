import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';

abstract class DailyChartState {}

class DailyChartInitial extends DailyChartState {}

class DailyChartLoading extends DailyChartState {}

class DailyChartLoaded extends DailyChartState {
  final DailyChart dailyChart;
  final WeeklyChart weeklyChart;
  final MaxChart maxChart;

  DailyChartLoaded({required this.dailyChart, required this.weeklyChart, required this.maxChart});
}

class DailyChartError extends DailyChartState {
  final String errorMsg;

  DailyChartError({required this.errorMsg});
}