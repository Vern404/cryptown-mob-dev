
import 'package:drc_cryptown/models/user/signup-model.dart';
import 'package:drc_cryptown/service/user/user-sign-up-service.dart';
import 'package:drc_cryptown/states/user/sign-up/sign-up-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit():super(SignUpLoading());

  Future<void> fetchUserSignUpJWT(email,username,password,confirm_password) async {
    UserSignUpService userSignUpService = UserSignUpService();

    emit(SignUpLoading());

    try {
      UserSignUp userSignUp = await userSignUpService.fetchUserSignUpJWT(email, username, password, confirm_password);

      emit(SignUpLoaded(userSignUp: userSignUp));
    } catch (e) {
      emit(SignUpError(errorMsg: e.toString()));
    }
  }
}