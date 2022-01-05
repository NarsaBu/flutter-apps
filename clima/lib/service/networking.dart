import 'dart:convert';

import 'package:clima/model/weather.dart';
import 'package:http/http.dart';

class WeatherClient {
  final double longitude;
  final double latitude;

  static const url = 'api.openweathermap.org';
  static const path = '/data/2.5/weather';
  static const apiKey = '4dea9be32883d9ac78dd78687a0b64c5';

  WeatherClient(this.longitude, this.latitude);

  Future<Weather> performRequestByCoord() async {
    Uri uri = Uri.https(url, path, {
      'lon': longitude.toString(),
      'lat': latitude.toString(),
      'units': 'metric',
      'appid': apiKey
    });
    Response response = await get(uri);

    if (response.statusCode == 200) {
      String body = response.body;

      Weather weather = Weather();
      weather.latitude =
          double.parse(jsonDecode(body)['coord']['lat'].toString());
      weather.longitude =
          double.parse(jsonDecode(body)['coord']['lon'].toString());
      weather.temperature =
          double.parse(jsonDecode(body)['main']['temp'].toString()).toInt();
      weather.city = jsonDecode(body)['name'].toString();
      weather.conditionCode =
          int.parse(jsonDecode(body)['weather'][0]['id'].toString());

      return weather;
    } else {
      throw ClientException(
          'something wrong with request or service. Status code: ${response.statusCode}. Response body: ${response.body}',
          uri);
    }
  }

  Future<Weather> performRequestByCity(String city) async {
    Uri uri =
        Uri.https(url, path, {'q': city, 'units': 'metric', 'appid': apiKey});
    Response response = await get(uri);

    if (response.statusCode == 200) {
      String body = response.body;

      Weather weather = Weather();
      weather.latitude =
          double.parse(jsonDecode(body)['coord']['lat'].toString());
      weather.longitude =
          double.parse(jsonDecode(body)['coord']['lon'].toString());
      weather.temperature =
          double.parse(jsonDecode(body)['main']['temp'].toString()).toInt();
      weather.city = jsonDecode(body)['name'].toString();
      weather.conditionCode =
          int.parse(jsonDecode(body)['weather'][0]['id'].toString());

      return weather;
    } else {
      throw ClientException(
          'something wrong with request or service. Status code: ${response.statusCode}. Response body: ${response.body}',
          uri);
    }
  }
}
