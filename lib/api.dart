import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  Future<double> getBitcoinRate() async {
    final response =
        await http.get(Uri.parse("https://cex.io/api/ticker/BTC/USD"));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      return double.parse(json["last"]);
    } else {
      // We don't have the request data
      throw Exception('Failed to load rates');
    }
  }
}
