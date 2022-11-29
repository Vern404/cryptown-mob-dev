
import 'package:drc_cryptown/models/user/login-model.dart';
import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:drc_cryptown/states/user/sign-in/sign-in-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit():super(SignInLoading());

  Future<void> fetchUserSignInJWT(data) async {
    UserService userService = UserService();

    emit(SignInLoading());

    try {
      UserSignIn userSignIn = await userService.login(data);

      emit(SignInLoaded(userSignIn: userSignIn));
    } catch (e) {
      emit(SignInError(errorMsg: e.toString()));
    }
  }
}