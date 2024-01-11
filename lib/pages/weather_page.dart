import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // apikey
  final _weatherService = WeatherService('f5304e17b823cc9392c4a0e102098b2b');
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
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
