import 'package:crypto_converter/api.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  var amountUSD = 0.0;
  var amountCrypto = 0.0;
  var rate = 0.0;

  calculateRate() {
    setState(() {
      amountCrypto = amountUSD / rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Converter")),
      body: FutureBuilder(
        future: API().getBitcoinRate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              return const Text("We couldn't load the data");
            } else {
              setState(() {
                rate = snapshot.data!;
              });
              return Column(
                children: [
                  const SizedBox(height: 40),
                  const Text('Enter your amount in USD'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) {
                        try {
                          setState(() {
                            amountUSD = double.parse(value);
                          });
                        } on Exception catch (e) {}
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: calculateRate, child: const Text("Get Rate")),
                  const SizedBox(height: 40),
                  Text("You can buy ${amountCrypto.toStringAsFixed(4)} of BTC"),
                ],
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
