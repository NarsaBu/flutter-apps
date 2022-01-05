import 'dart:convert';

import 'package:http/http.dart';

class CoinClient {
  static const url = 'rest.coinapi.io';
  static const path = '/v1/exchangerate';
  static const apiKey = 'DBD74501-4BA6-4FF4-8D63-3B59B5629A05';

  Future<int> performRequest(String cryptoCurrency, String realCurrency) async {
    String completePath = '$path/$cryptoCurrency/$realCurrency';

    Uri uri = Uri.https(url, completePath, {'apikey': apiKey});
    Response response = await get(uri);

    if (response.statusCode == 200) {
      String body = response.body;
      return double.parse(jsonDecode(body)['rate'].toString()).toInt();
    } else {
      throw ClientException(
          'something wrong with request or service. Status code: ${response.statusCode}. Response body: ${response.body}',
          uri);
    }
  }
}
