import 'package:drc_cryptown/models/cryto-model.dart';
import 'package:drc_cryptown/service/crypto-service.dart';
import 'package:drc_cryptown/states/crypto/crypto-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit():super(CryptoLoading());

  Future<void> fetchCryptoList() async {
    CryptoService cryptoService = CryptoService();

    emit(CryptoLoading());

    try {
      CryptoListModel cryptoListModel = await cryptoService.fetchCryptoList();

      emit(CryptoLoaded(cryptoListModel: cryptoListModel));
    } catch (e) {
      emit(CryptoError(errorMsg: e.toString()));
    }
  }
}