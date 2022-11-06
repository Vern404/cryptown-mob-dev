import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';
import 'package:drc_cryptown/service/crypto-details/crypto-details-service.dart';
import 'package:drc_cryptown/states/crypto-details/crypto-details-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsCubit extends Cubit<CryptoDetailsState> {
  CryptoDetailsCubit():super(CryptoDetailsLoading());

  Future<void> fetchCryptoDetailsList() async {
    CryptoDetailsService cryptoService = CryptoDetailsService();

    emit(CryptoDetailsLoading());

    try {
      CryptoDetailsModel cryptoDetailsModel = await cryptoService.fetchCryptoDetails();

      emit(CryptoDetailsLoaded(cryptoDetailsModel: cryptoDetailsModel));
    } catch (e) {
      emit(CryptoDetailsError(errorMsg: e.toString()));
    }
  }
}