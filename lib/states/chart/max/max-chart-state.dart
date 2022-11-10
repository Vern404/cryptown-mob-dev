import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';

abstract class MaxChartState {}

class MaxChartInitial extends MaxChartState {}

class MaxChartLoading extends MaxChartState {}

class MaxChartLoaded extends MaxChartState {
  final MaxChart maxChart;

  MaxChartLoaded({required this.maxChart});
}

class MaxChartError extends MaxChartState {
  final String errorMsg;

  MaxChartError({required this.errorMsg});
}