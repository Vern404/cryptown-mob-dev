

import 'package:drc_cryptown/widgets/forum-card.dart';
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
          backgroundColor: Color.fromRGBO(38, 2, 105, 1.0),
          title:Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,width: 150,),
        ),
        body:Column(
          children: [
            const SizedBox(height: 10),
            Text('FORUM',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.white,
              ),),
            const SizedBox(height: 10),
            Expanded(child: ForumCard())
          ],
        )

    );
  }
}
