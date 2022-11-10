import 'package:drc_cryptown/models/Crypto/crypto-chart/max-chart.dart';
import 'package:drc_cryptown/service/crypto-details/chart/max-chart-service.dart';
import 'package:drc_cryptown/states/chart/max/max-chart-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaxChartCubit extends Cubit<MaxChartState> {
  MaxChartCubit():super(MaxChartLoading());

  Future<void> fetchMaxChart(cryptoId) async {
    MaxChartService maxChartService = MaxChartService();

    emit(MaxChartLoading());

    try {
      MaxChart maxChart = await maxChartService.fetchMaxChart(cryptoId);

      emit(MaxChartLoaded(maxChart: maxChart));
    } catch (e) {
      emit(MaxChartError(errorMsg: e.toString()));
    }
  }
}