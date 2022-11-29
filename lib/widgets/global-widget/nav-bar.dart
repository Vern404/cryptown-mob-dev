import 'package:drc_cryptown/service/user/user-service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: const Color.fromRGBO(2, 29, 128, 1.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              // padding: Ed/geInsets.symmetric(horizontal: 15.0, vertical: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 27, 56, 1.0),
                image: DecorationImage(
                  alignment: AlignmentDirectional.bottomEnd,
                  image: AssetImage('assets/image/logo.png'),
                  fit: BoxFit.fitWidth,
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome to Cryptown',
                  style: TextStyle(color: Color.fromRGBO(75, 105, 254, 1), fontSize: 16),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on, color: Colors.white60,),
              title: Text('Crypto'),
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.white60,),
              title: Text('Watchlist'),
              onTap: () => {Navigator.of(context).pushNamed('/watch-list')},
            ),
            ListTile(
              leading: Icon(Icons.tips_and_updates, color: Colors.white60,),
              title: Text('Exchange List'),
              onTap: () => {Navigator.of(context).pushNamed('/exchange-list')},
            ),
            ListTile(
              leading: Icon(Icons.forum, color: Colors.white60,),
              title: Text('Forum'),
              onTap: () => {Navigator.of(context).pushNamed('/forum')},
            ),
            ListTile(
              leading: Icon(Icons.newspaper, color: Colors.white60,),
              title: Text('News'),
              onTap: () => {Navigator.of(context).pushNamed('/news-list')},
            ),
            ListTile(
              leading: Icon(Icons.account_circle, color: Colors.white60,),
              title: Text('Profile Settings'),
              onTap: () => {Navigator.of(context).pushNamed('/profile')},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white60,),
              title: Text('Logout'),
              onTap: () async {
                final UserService _apiClient = UserService();
                SharedPreferences _prefs = await SharedPreferences.getInstance();
                String accesstoken = _prefs.getString("userJwt")!;
                await _apiClient.logout(accesstoken);
                await _prefs.remove(accesstoken);
                Navigator.of(context).pushNamed('/sign-in');
              },
            ),
          ],
        ),
      )

    );
  }
}
