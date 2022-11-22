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
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(152, 203, 255, 1.0),
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.cover,height: 180,),
      ),
      body: Column(
        children: [
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
    );
  }
}
