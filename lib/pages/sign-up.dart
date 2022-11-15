import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
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
        drawer: NavBar(),
        appBar: AppBar(
          centerTitle: true,
          title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
        ),
        body:Container(
          child: SignUp(),
        )

    );
  }
}
