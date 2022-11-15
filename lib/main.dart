import 'package:drc_cryptown/pages/exchange-list.dart';
import 'package:drc_cryptown/pages/news.dart';
import 'package:drc_cryptown/pages/param/chart-details-param.dart';
import 'package:drc_cryptown/pages/param/crypto-details-param.dart';
import 'package:drc_cryptown/pages/sign-in.dart';
import 'package:drc_cryptown/pages/sign-up.dart';
import 'package:drc_cryptown/states/chart/daily/daily-chart-cubit.dart';
import 'package:drc_cryptown/states/crypto-details/crypto-details-cubit.dart';
import 'package:drc_cryptown/states/crypto/crypto-cubit.dart';
import 'package:drc_cryptown/states/exchange-list/exchange-list-cubit.dart';
import 'package:drc_cryptown/states/news/news-cubit.dart';
import 'package:drc_cryptown/pages/crypto-list.dart';
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

  MaterialColor color = MaterialColor(0xffbeeeff, <int, Color>{
    50: Color(0xffbeeeff),
    100: Color(0xffbeeeff),
    200: Color(0xffbeeeff),
    300: Color(0xffbeeeff),
    400: Color(0xffbeeeff),
    500: Color(0xffbeeeff),
    600: Color(0xffbeeeff),
    700: Color(0xffbeeeff),
    800: Color(0xffbeeeff),
    900: Color(0xffbeeeff),
  },
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptown',
      theme: ThemeData(
        primaryColor: color,
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
  },
    );
  }
}

