import 'package:drc_cryptown/models/Crypto/crypto-chart/daily-chart.dart';
import 'package:drc_cryptown/models/Crypto/crypto-details-model.dart';

abstract class CryptoDetailsState {}

class CryptoDetailsInitial extends CryptoDetailsState {}

class CryptoDetailsLoading extends CryptoDetailsState {}

class CryptoDetailsLoaded extends CryptoDetailsState {
  final CryptoDetailsModel cryptoDetailsModel;
  final DailyChart dailyChart;
  CryptoDetailsLoaded({required this.cryptoDetailsModel, required this.dailyChart});
}

class CryptoDetailsError extends CryptoDetailsState {
  final String errorMsg;

  CryptoDetailsError({required this.errorMsg});
}