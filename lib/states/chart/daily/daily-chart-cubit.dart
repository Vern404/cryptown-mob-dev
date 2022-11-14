import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/weekly-chart.dart';
import 'package:drc_cryptown/service/crypto-details/chart/daily-chart-service.dart';
import 'package:drc_cryptown/service/crypto-details/chart/max-chart-service.dart';
import 'package:drc_cryptown/service/crypto-details/chart/weekly-chart-service.dart';
import 'package:drc_cryptown/states/chart/daily/daily-chart-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyChartCubit extends Cubit<DailyChartState> {
  DailyChartCubit():super(DailyChartLoading());

  Future<void> fetchDailyChart(cryptoId) async {
    DailyChartService dailyChartService = DailyChartService();
    WeeklyChartService weeklyChartService = WeeklyChartService();
    MaxChartService maxChartService = MaxChartService();

    emit(DailyChartLoading());

    try {
      DailyChart dailyChart = await dailyChartService.fetchDailyChart(cryptoId);
      WeeklyChart weeklyChart = await weeklyChartService.fetchWeeklyChart(cryptoId);
      MaxChart maxChart = await maxChartService.fetchMaxChart(cryptoId);

      emit(DailyChartLoaded(dailyChart: dailyChart, weeklyChart: weeklyChart, maxChart: maxChart));
    } catch (e) {
      emit(DailyChartError(errorMsg: e.toString()));
    }
  }
}