
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';

abstract class WeeklyChartState {}

class WeeklyChartInitial extends WeeklyChartState {}

class WeeklyChartLoading extends WeeklyChartState {}

class WeeklyChartLoaded extends WeeklyChartState {
  final WeeklyChart weeklyChart;

  WeeklyChartLoaded({required this.weeklyChart});
}

class WeeklyChartError extends WeeklyChartState {
  final String errorMsg;

  WeeklyChartError({required this.errorMsg});
}