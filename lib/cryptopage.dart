import 'package:crypto_converter/api.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  String cryptoCode;
  CryptoPage(this.cryptoCode, {super.key});

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  var amountUSD = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.cryptoCode} Converter")),
      body: FutureBuilder(
        future: API().getRate(widget.cryptoCode),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.hasError) {
              return const Text("We couldn't load the data");
            } else {
              return Column(
                children: [
                  const SizedBox(height: 40),
                  Text('Current Rate: ${snapshot.data}'),
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
                  Text(
                      "You can buy ${(amountUSD / snapshot.data!).toStringAsFixed(4)} ${widget.cryptoCode}"),
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
