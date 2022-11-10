import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/service/crypto-details/chart/daily-chart-service.dart';
import 'package:drc_cryptown/service/crypto-details/crypto-details-service.dart';
import 'package:drc_cryptown/states/crypto-details/crypto-details-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsCubit extends Cubit<CryptoDetailsState> {
  CryptoDetailsCubit():super(CryptoDetailsLoading());

  Future<void> fetchCryptoDetailsByCryptoId(cryptoId) async {
    CryptoDetailsService cryptoService = CryptoDetailsService();
    DailyChartService dailyChartService = DailyChartService();

    emit(CryptoDetailsLoading());

    try {
      CryptoDetailsModel cryptoDetailsModel = await cryptoService.fetchCryptoDetailsByCryptoId(cryptoId);
      DailyChart dailyChart = await dailyChartService.fetchDailyChart(cryptoId);

      emit(CryptoDetailsLoaded(cryptoDetailsModel: cryptoDetailsModel, dailyChart: dailyChart));
    } catch (e) {
      emit(CryptoDetailsError(errorMsg: e.toString()));
    }
  }
}