import 'package:drc_cryptown/states/chart/daily/daily-chart-cubit.dart';
import 'package:drc_cryptown/states/chart/daily/daily-chart-state.dart';
import 'package:drc_cryptown/widgets/crypto/line-chart.dart';
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({required this.cryptoId, Key? key}) : super(key: key);
  final String cryptoId;
  @override
  Widget build(BuildContext context) {
    DailyChartCubit cubit = BlocProvider.of<DailyChartCubit>(context)
      ..fetchDailyChart(cryptoId);
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
            child: BlocBuilder<DailyChartCubit, DailyChartState>(
            bloc: cubit,
            builder: ((context, state) {
              if (state is DailyChartLoading) {
                return Center(child: const CircularProgressIndicator());
              }

              if (state is DailyChartLoaded) {
                return LineChartWidget(
                    dailyChart: state.dailyChart,
                    weeklyChart: state.weeklyChart,
                    maxChart: state.maxChart
                );
              }

              return Text(state is DailyChartError
              ? state.errorMsg
                  : 'Unknown Error');
        }),
    ),
    ),

        ],
        )
    );
  }
}
