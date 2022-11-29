
// import 'package:drc_cryptown/models/forum/forum-list-model.dart';
import 'package:drc_cryptown/service/forum-service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  // print(forumlist);
                  List<dynamic> forum = List<dynamic>.from(forumlist.entries.map((kv)=>kv.value));
                  // List<String> forum = List.castFrom(forumlist.map((e) => List<String>.from(e)).toList());

                  return ListView.builder(
                      itemCount: forum.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Color.fromRGBO(127, 156, 200, 1.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child:Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          )
                                      ),),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(forum[index]['postdatetime'],
                                          style: GoogleFonts.robotoMono(
                                            fontStyle: FontStyle.italic,
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w200,
                                                fontSize: 12,
                                              )
                                          ),),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    // Text(forum[index]['replies']),
                                  ],
                                ),
                              ),
                            )
                        );
                      }
                  );
                } else {
                  debugPrint(snapshot.error.toString());
                }
                return const SizedBox();
              }),
        )
    );
  }
}
