import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';

abstract class DailyChartState {}

class DailyChartInitial extends DailyChartState {}

class DailyChartLoading extends DailyChartState {}

class DailyChartLoaded extends DailyChartState {
  final DailyChart dailyChart;

  DailyChartLoaded({required this.dailyChart});
}

class DailyChartError extends DailyChartState {
  final String errorMsg;

  DailyChartError({required this.errorMsg});
}