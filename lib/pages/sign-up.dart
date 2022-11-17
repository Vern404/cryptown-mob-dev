
import 'package:drc_cryptown/states/user/sign-up/sign-up-cubit.dart';
import 'package:drc_cryptown/states/user/sign-up/sign-up-state.dart';
import 'package:drc_cryptown/widgets/sign-up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // final String email;
  // final String username;
  // final String password;
  // final String confirmPassword;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context)
    ..fetchUserSignUpJWT(email, username, password, confirmPassword);

  @override
  Widget build(BuildContext context) {
    Expanded(
      child: BlocBuilder<SignUpCubit, SignUpState>(
        bloc: cubit,
        builder: ((context, state) {
          if (state is SignUpLoading) {
            return Center(child: const CircularProgressIndicator());
          }

          if (state is SignUpLoaded) {
            return SignUp();
          }

          return Text(state is SignUpError
              ? state.errorMsg
              : 'Unknown Error');
        }),
      ),
    );
  }
}
