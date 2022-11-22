import 'package:drc_cryptown/states/crypto/crypto-cubit.dart';
import 'package:drc_cryptown/states/crypto/crypto-state.dart';
import 'package:drc_cryptown/widgets/crypto/crypto-box.dart';
import 'package:drc_cryptown/widgets/global-widget/nav-bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../models/Crypto/cryto-model.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  // List<String> searchResult = [];
  // List<CryptoList> cryptoList = [];
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
            const SizedBox(height: 20),
            TextField(
              onChanged: (_){
                setState(() {
                });
              },
              controller: controller,
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(133, 191, 255, 1),
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Crypto',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blueAccent),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              child: Text(
                'Crypto List',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      Text('No.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),),
                      const SizedBox(width: 20),
                      Text('Coin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Text('Price',
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
              child: BlocBuilder<CryptoCubit, CryptoState>(
                bloc: cubit,
                builder: ((context, state) {
                  if (state is CryptoLoading) {
                    return Center(child: const CircularProgressIndicator());
                  }
                  if (state is CryptoLoaded) {
                    return CryptoCard(cryptoListModel: state.cryptoListModel);
                    // if (searchResult.length != 0 || controller.text.isNotEmpty) {
                    //   return CryptoCard(cryptoListModel: state.cryptoListModel);
                    // } else {
                    //   return new ListView.builder(
                    //     itemCount: searchResult.length,
                    //     itemBuilder: (context, i) {
                    //       return new Card(
                    //         child: Column(
                    //         children: [
                    //           Text(searchResult[i],)
                    //         ],
                    //         )
                    //       );
                    //     },
                    //   );
                    // }

                    // List<CryptoList> toRender = controller.text.isNotEmpty
                    //     ? List.from(
                    //     state.cryptoListModel.cryptoList.expand((data) {
                    //       if (data.name.contains(controller.text)) {
                    //         return [data];
                    //       }
                    //       return <CryptoList>[];
                    //     }))
                    //     : (state.cryptoListModel.cryptoList);
                    //
                    // return ListView.builder(
                    //     itemCount: toRender.length,
                    //     itemBuilder: ((context, index) {
                    //       return CryptoCard(cryptoListModel:toRender[index]);
                    //     }));

                  }
                  return Text(state is CryptoError
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
