import 'package:drc_cryptown/widgets/nav-bar.dart';
import 'package:drc_cryptown/widgets/sign-in.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          child:SignIn()
      )
    );
  }
}
