import 'package:drc_cryptown/models/user/signup-model.dart';
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpLoaded extends SignUpState {
  final UserSignUp userSignUp;
  SignUpLoaded({required this.userSignUp});
}

class SignUpError extends SignUpState {
  final String errorMsg;

  SignUpError({required this.errorMsg});
}