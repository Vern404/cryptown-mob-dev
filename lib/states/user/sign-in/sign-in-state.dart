import 'package:drc_cryptown/models/user/login-model.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {
  final UserSignIn userSignIn;
  SignInLoaded({required this.userSignIn});
}

class SignInError extends SignInState {
  final String errorMsg;

  SignInError({required this.errorMsg});
}