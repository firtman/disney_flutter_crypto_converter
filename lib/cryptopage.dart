import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  var amountUSD = 0.0;
  var amountCrypto = 0.0;

  calculateRate() {
    setState(() {
      amountCrypto = amountUSD / 25800;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crypto Converter")),
      body: Column(
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
      ),
    );
  }
}
