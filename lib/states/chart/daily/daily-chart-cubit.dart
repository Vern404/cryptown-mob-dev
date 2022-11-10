import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/service/crypto-details/chart/daily-chart-service.dart';
import 'package:drc_cryptown/states/chart/daily/daily-chart-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyChartCubit extends Cubit<DailyChartState> {
  DailyChartCubit():super(DailyChartLoading());

  Future<void> fetchDailyChart(cryptoId) async {
    DailyChartService dailyChartService = DailyChartService();

    emit(DailyChartLoading());

    try {
      DailyChart dailyChart = await dailyChartService.fetchDailyChart(cryptoId);

      emit(DailyChartLoaded(dailyChart: dailyChart));
    } catch (e) {
      emit(DailyChartError(errorMsg: e.toString()));
    }
  }
}