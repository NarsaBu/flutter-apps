import 'package:clima/model/weather.dart';
import 'package:clima/screen/location_screen.dart';
import 'package:clima/service/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherFromCurrentLocation();
  }

  Future<void> getWeatherFromCurrentLocation() async {
    Weather weather = await WeatherModel().getWeatherFromCurrentLocation();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weather: weather);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
