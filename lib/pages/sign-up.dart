
import 'package:drc_cryptown/widgets/sign-up.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body:Container(
            child:Column(
              children: [
                Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 300,),
                SignUp(),
              ],
            )
        )
    );
  }
}
