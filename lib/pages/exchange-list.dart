import 'package:drc_cryptown/states/exchange-list/exchange-list-cubit.dart';
import 'package:drc_cryptown/states/exchange-list/exchange-list-state.dart';
import 'package:drc_cryptown/widgets/exchange-box.dart';
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeList extends StatefulWidget {
  const ExchangeList({Key? key}) : super(key: key);

  @override
  State<ExchangeList> createState() => _ExchangeListState();
}

class _ExchangeListState extends State<ExchangeList> {
  @override
  Widget build(BuildContext context) {
    ExchangeCubit cubit = BlocProvider.of<ExchangeCubit>(context)
      ..fetchExchangeList();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              child: Text(
                'Exchange List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: Text(
                'This exchange list is listed accroding the Trust Score Rank',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(68, 140, 249, 1.0),
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  Text('Exchange',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),),
                  const SizedBox(width: 20),
                  Text('Trust Score',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),),
                  const SizedBox(width: 20),
                  Text('Trade Volume',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),),
                  const SizedBox(width: 5),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<ExchangeCubit, ExchangeState>(
                bloc: cubit,
                builder: ((context, state) {
                  if (state is ExchangeLoading) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  if (state is ExchangeLoaded) {
                    return ExchangeListCard(exchangeListModel: state.exchangeListModel);
                  }
                  return Text(state is ExchangeError
                      ? state.errorMsg
                      : 'Unknown Error');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
