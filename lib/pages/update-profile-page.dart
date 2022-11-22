
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
      title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
    ),
    body: UpdateProfile()
    );
  }
}
