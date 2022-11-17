
import 'package:drc_cryptown/models/user/login-model.dart';
import 'package:drc_cryptown/service/user/user-login-service.dart';
import 'package:drc_cryptown/states/user/sign-in/sign-in-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit():super(SignInLoading());

  Future<void> fetchUserSignInJWT(email,username,password,confirm_password) async {
    UserSignInService userSignInService = UserSignInService();

    emit(SignInLoading());

    try {
      UserSignIn userSignIn = await userSignInService.fetchUserSignInJWT(email, password);

      emit(SignInLoaded(userSignIn: userSignIn));
    } catch (e) {
      emit(SignInError(errorMsg: e.toString()));
    }
  }
}