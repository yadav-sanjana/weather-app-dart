import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // apikey
  final _weatherService = WeatherService('b95622a95da67184fdc377605e261ffe');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // current city
    String cityName = await _weatherService.getCurrentCity();

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animation
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_weather?.cityName ?? "city.."),
          Text("${_weather?.temperature.round()} C" ?? "loading temp..")
        ],
      ),
    ));
  }
}
