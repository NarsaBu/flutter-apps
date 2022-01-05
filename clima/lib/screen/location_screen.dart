import 'package:clima/model/weather.dart';
import 'package:clima/screen/city_skreen.dart';
import 'package:clima/service/networking.dart';
import 'package:clima/service/weather.dart';
import 'package:clima/util/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final Weather weather;

  const LocationScreen({required this.weather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel _weatherModel = WeatherModel();
  Weather weather = Weather();

  @override
  void initState() {
    super.initState();
    updateUI(widget.weather);
  }

  void updateUI(Weather weatherData) {
    setState(() {
      weather.latitude = weatherData.latitude;
      weather.longitude = weatherData.longitude;
      weather.temperature = weatherData.temperature;
      weather.city = weatherData.city;
      weather.conditionCode = weatherData.conditionCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      Weather updatedWeather =
                          await _weatherModel.getWeatherFromCurrentLocation();
                      updateUI(updatedWeather);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(typedName);
                      if (typedName != null) {
                        Weather weather = await WeatherClient(2.2, 3.3)
                            .performRequestByCity(typedName);
                        updateUI(weather);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${weather.temperature}°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '${_weatherModel.getWeatherIcon(weather.conditionCode)}️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${_weatherModel.getMessage(weather.temperature)} in ${weather.city}!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
