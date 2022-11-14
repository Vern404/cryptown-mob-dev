import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';

abstract class CryptoDetailsState {}

class CryptoDetailsInitial extends CryptoDetailsState {}

class CryptoDetailsLoading extends CryptoDetailsState {}

class CryptoDetailsLoaded extends CryptoDetailsState {
  final CryptoDetailsModel cryptoDetailsModel;
  CryptoDetailsLoaded({required this.cryptoDetailsModel});
}

class CryptoDetailsError extends CryptoDetailsState {
  final String errorMsg;

  CryptoDetailsError({required this.errorMsg});
}