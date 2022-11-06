import 'package:drc_cryptown/models/Exchange-List/exchange-list-model.dart';

abstract class ExchangeState {}

class ExchangeInitial extends ExchangeState {}

class ExchangeLoading extends ExchangeState {}

class ExchangeLoaded extends ExchangeState {
  final ExchangeListModel exchangeListModel;

  ExchangeLoaded({required this.exchangeListModel});
}

class ExchangeError extends ExchangeState {
  final String errorMsg;

  ExchangeError({required this.errorMsg});
}