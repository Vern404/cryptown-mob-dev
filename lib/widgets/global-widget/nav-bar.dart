import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: Color.fromRGBO(133, 191, 255, 100),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 247, 255, 100),
                image: DecorationImage(
                  image: AssetImage('assets/image/logo.png'),
                  fit: BoxFit.cover,
                )
              ),
              child: Text(
                'Welcome to Cryptown',
                style: TextStyle(color: Color.fromRGBO(75, 105, 254, 100), fontSize: 16),
              ),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Crypto'),
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Watchlist'),
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
            ListTile(
              leading: Icon(Icons.tips_and_updates),
              title: Text('Exchange List'),
              onTap: () => {Navigator.of(context).pushNamed('/exchange-list')},
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Forum'),
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
            ListTile(
              leading: Icon(Icons.newspaper),
              title: Text('News'),
              onTap: () => {Navigator.of(context).pushNamed('/news-list')},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile Settings'),
              onTap: () => {Navigator.of(context).pushNamed('/sign-in')},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pushNamed('/sign-up')},
            ),
          ],
        ),
      )

    );
  }
}