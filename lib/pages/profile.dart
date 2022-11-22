
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:drc_cryptown/widgets/profile/profile.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
      title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
    ),
    body: Profile()
    );
  }
}
