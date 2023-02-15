import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '222013d268624fbbaf583854231402';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weatherModel;
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(
        response.body,
      );
      weatherModel = WeatherModel.fromJson(data);
    } catch (e) {
      print(e);
    }
    return weatherModel;
  }
}
