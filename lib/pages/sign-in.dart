
import 'package:drc_cryptown/widgets/sign-in.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        // resizeToAvoidBottomInset: false,
      body:Container(
          child:Column(
            children: [
              Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 300,),
              signIn(),
            ],
          )
      )
    );
  }
}
