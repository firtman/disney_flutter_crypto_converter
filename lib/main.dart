import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Crypto Converter")),
        body: Column(
          children: [
            const SizedBox(height: 40),
            const Text('Enter your amount in USD'),
            const TextField(),
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {}, child: const Text("Get Rate")),
          ],
        ),
      ),
    );
  }
}
