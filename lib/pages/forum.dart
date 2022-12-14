

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
            const SizedBox(height: 5),
            Text('Welcome to Cryptown Community',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Colors.white,
              ),),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('The forum just to display topics that discussed from Cryptown website, post and reply will be coming soon',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                  color: Colors.white60,
                ),),
            ),
            const SizedBox(height: 10),
            Expanded(child: ForumCard())
          ],
        )

    );
  }
}
