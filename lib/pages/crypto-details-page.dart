
import 'package:drc_cryptown/states/crypto-details/crypto-details-cubit.dart';
import 'package:drc_cryptown/states/crypto-details/crypto-details-state.dart';
import 'package:drc_cryptown/widgets/crypto/crypto-details.dart';
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoDetailsPage extends StatelessWidget {
  const CryptoDetailsPage({required this.cryptoId, Key? key}) : super(key: key);
  final String cryptoId;

  @override
  Widget build(BuildContext context) {
    CryptoDetailsCubit cubit = BlocProvider.of<CryptoDetailsCubit>(context)
      ..fetchCryptoDetailsByCryptoId(cryptoId);

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 2, 105, 1.0),
        centerTitle: true,
        title:Image.asset('assets/image/logo.png',fit: BoxFit.fitWidth,width: 150,),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CryptoDetailsCubit, CryptoDetailsState>(
              bloc: cubit,
              builder: ((context, state) {
                if (state is CryptoDetailsLoading) {
                  return Center(child: const CircularProgressIndicator());
                }

                if (state is CryptoDetailsLoaded) {
                  return CryptoDetailsCard(cryptoDetailsModel: state.cryptoDetailsModel);
                }

                return Text(state is CryptoDetailsError
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
