
import 'package:drc_cryptown/service/forum-service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForumCard extends StatefulWidget {
  const ForumCard({Key? key}) : super(key: key);

  @override
  State<ForumCard> createState() => _ForumCardState();
}

class _ForumCardState extends State<ForumCard> {

  final ForumService forumService = ForumService();
  late String accesstoken;

  Future<Map<String, dynamic>> getForumlist() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    accesstoken = _prefs.getString("userJwt")!;
    dynamic Res;
    Res = await forumService.getForum('$accesstoken');
    return Res;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: FutureBuilder<Map<String, dynamic>>(
              future: getForumlist(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: size.height,
                      width: size.width,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  //get json response body data into list
                  var forumlist = snapshot.data!["postsObj"];
                  List<dynamic> forum = List<dynamic>.from(forumlist.entries.map((kv)=>kv.value));

                  if (forum.isEmpty){
                    return Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.all(20),
                      child: Text('No forum yet',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ) ,),
                    );
                  } else{
                    return ListView.builder(
                        itemCount: forum.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                            child: Card(
                                color: Color.fromRGBO(127, 156, 200, 1.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child:Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(forum[index]['username'],
                                              style: GoogleFonts.robotoMono(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14,
                                                  )
                                              ),),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(forum[index]['post'],
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              )
                                          ),),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(DateFormat.yMMMMEEEEd().format(DateTime.parse(forum[index]['postdatetime'])),
                                              style: GoogleFonts.robotoMono(
                                                  fontStyle: FontStyle.italic,
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                  )
                                              ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                            ),
                          );
                        }
                    );
                  }

                } else {
                  debugPrint(snapshot.error.toString());
                }
                return const SizedBox();
              }),
        )
    );
  }
}
