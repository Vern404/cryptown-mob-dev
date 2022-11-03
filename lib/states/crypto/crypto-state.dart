import 'package:drc_cryptown/models/cryto-model.dart';

abstract class CryptoState {}

class CryptoInitial extends CryptoState {}

class CryptoLoading extends CryptoState {}

class CryptoLoaded extends CryptoState {
  final CryptoListModel cryptoListModel;

  CryptoLoaded({required this.cryptoListModel});
}

class CryptoError extends CryptoState {
  final String errorMsg;

  CryptoError({required this.errorMsg});
}