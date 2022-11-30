
import 'dart:ui';

import 'package:drc_cryptown/pages/exchange-list.dart';
import 'package:drc_cryptown/pages/forum.dart';
import 'package:drc_cryptown/pages/news.dart';
import 'package:drc_cryptown/pages/param/chart-details-param.dart';
import 'package:drc_cryptown/pages/param/crypto-details-param.dart';
import 'package:drc_cryptown/pages/profile.dart';
import 'package:drc_cryptown/pages/sign-in.dart';
import 'package:drc_cryptown/pages/sign-up.dart';
import 'package:drc_cryptown/pages/watch-list.dart';
import 'package:drc_cryptown/states/chart/daily/daily-chart-cubit.dart';
import 'package:drc_cryptown/states/crypto-details/crypto-details-cubit.dart';
import 'package:drc_cryptown/states/crypto/crypto-cubit.dart';
import 'package:drc_cryptown/states/exchange-list/exchange-list-cubit.dart';
import 'package:drc_cryptown/states/news/news-cubit.dart';
import 'package:drc_cryptown/pages/crypto-list.dart';
// import 'package:drc_cryptown/states/user/sign-in/sign-in-cubit.dart';
// import 'package:drc_cryptown/states/user/sign-up/sign-up-cubit.dart';
import 'package:drc_cryptown/pages/update-profile-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers:[
    BlocProvider(create: (context) => CryptoCubit()),
    BlocProvider(create: (context) => NewsCubit()),
    BlocProvider(create: (context) => ExchangeCubit()),
    BlocProvider(create: (context) => CryptoDetailsCubit()),
    BlocProvider(create: (context) => DailyChartCubit()),
  ],child: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptown',
      theme: ThemeData(
        // primaryColor: Color.fromRGBO(146, 203, 248, 1.0),
          splashColor: Colors.deepPurple[700],
        scaffoldBackgroundColor: Color.fromRGBO(13, 0, 99, 1.0),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white60),
          hintStyle: TextStyle(color: Colors.white60),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color.fromRGBO(
                0, 66, 137, 1.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color.fromRGBO(152, 203, 255, 1.0)),
          ),
        ),
        textTheme: TextTheme(
          bodyText2:  const TextStyle(color: Colors.white),
          bodyText1: const TextStyle(color: Colors.white),
          button:  const TextStyle(color: Colors.white),
          subtitle1: const TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white60
        )

      ),
      home: const SignInPage(),
      routes: {
        '/crypto-list':(context) => CryptoPage(),
        '/news-list':(context) => NewsPage(),
        '/exchange-list':(context) => ExchangeList(),
        '/crypto-details':(context) => CryptoDetailsParam(),
        '/crypto-chart' :(context) => CryptoChartParam(),
        '/sign-in':(context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/profile': (context) => UserProfilePage(),
        '/forum': (context) => ForumPage(),
        '/watch-list': (context) => WatchListPage(),
        '/update-profile': (context) => UpdateUserProfilePage(),
  },
    );
  }
}
