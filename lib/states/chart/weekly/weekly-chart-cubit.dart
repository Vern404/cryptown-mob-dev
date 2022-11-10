import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';
import 'package:drc_cryptown/service/crypto-details/chart/weekly-chart-service.dart';
import 'package:drc_cryptown/states/chart/weekly/weekly-chart-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyChartCubit extends Cubit<WeeklyChartState> {
  WeeklyChartCubit():super(WeeklyChartLoading());

  Future<void> fetchWeeklyChart(cryptoId) async {
    WeeklyChartService weeklyChartService = WeeklyChartService();

    emit(WeeklyChartLoading());

    try {
      WeeklyChart weeklyChart = await weeklyChartService.fetchWeeklyChart(cryptoId);

      emit(WeeklyChartLoaded(weeklyChart: weeklyChart));
    } catch (e) {
      emit(WeeklyChartError(errorMsg: e.toString()));
    }
  }
}