import 'package:drc_cryptown/models/Exchange-List/exchange-list-model.dart';
import 'package:drc_cryptown/states/exchange-list/exchange-list-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drc_cryptown/service/exchange-service.dart';

class ExchangeCubit extends Cubit <ExchangeState>{
  ExchangeCubit():super(ExchangeLoading());

  Future<void> fetchExchangeList() async {
    ExchangeService exchangeService = ExchangeService();

    emit(ExchangeLoading());

    try {
      ExchangeListModel exchangeListModel = await exchangeService.fetchExchangeList();

      emit(ExchangeLoaded(exchangeListModel: exchangeListModel));
    } catch (e) {
      emit(ExchangeError(errorMsg: e.toString()));
    }
  }
}