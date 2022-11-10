import 'package:drc_cryptown/models/Crypto/cryto-model.dart';
import 'package:drc_cryptown/states/crypto/crypto-cubit.dart';
import 'package:drc_cryptown/states/crypto/crypto-state.dart';
import 'package:drc_cryptown/widgets/crypto-box.dart';
import 'package:drc_cryptown/widgets/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  List<String> result = List.empty(growable: true);
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    CryptoCubit cubit = BlocProvider.of<CryptoCubit>(context)
      ..fetchCryptoList();
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Crypto List'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (_) {
              setState(() {});
            },
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search Crypto',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CryptoCubit, CryptoState>(
              bloc: cubit,
              builder: ((context, state) {
                if (state is CryptoLoading) {
                  return Center(child: const CircularProgressIndicator());
                }
                if (state is CryptoLoaded) {
                    // return CryptoCard(cryptoListModel: state.cryptoListModel);
                  List<CryptoList> toRender = controller.text.isNotEmpty
                      ? List.from(
                      state.cryptoListModel.cryptoList.expand((element) {
                        if (element.name.contains(controller.text)) {
                          return [element];
                        }
                        return <CryptoList>[];
                      }))
                      : (state.cryptoListModel.cryptoList);

                  return ListView.builder(
                      itemCount: toRender.length,
                      itemBuilder: ((context, index) {
                        return CryptoCard(cryptoListModel: state.cryptoListModel);
                      }));
                }
                return Text(state is CryptoError
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
