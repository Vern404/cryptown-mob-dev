
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:drc_cryptown/widgets/profile/update-profile.dart';

class UpdateUserProfilePage extends StatefulWidget {
  const UpdateUserProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateUserProfilePage> createState() => _UpdateUserProfilePageState();
}

class _UpdateUserProfilePageState extends State<UpdateUserProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
    appBar: AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
      title:Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,width: 150,),
    ),
    body: UpdateProfile()
    );
  }
}
