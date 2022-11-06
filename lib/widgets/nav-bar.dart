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
              child: Text(
                'Cryptown',
                style: TextStyle(color: Colors.black, fontSize: 25),
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
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pushNamed('/crypto-list')},
            ),
          ],
        ),
      )

    );
  }
}
