

import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
        ),
        body: Column(
          children: [
          Text('Forum')
        ]
    )
    );
  }
}
