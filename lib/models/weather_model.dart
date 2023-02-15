import 'package:flutter/material.dart';

class WeatherModel {
  String country;
  String region;
  String lat;
  String lon;
  String tz_id;
  String avgHumidity;
  String humidity;
  String avgVis_km;
  String avgVis_miles;
  String is_Day;
  String pressure_mb;
  String pressure_in;
  String wind_dir;
  String cloud;
  String wind_degree;
  String gust_kph;
  String gust_mph;
  String time;
  String icon;
  String date;
  String avgTemp;
  String maxTemp;
  String minTemp;
  String weatherStateName;

  WeatherModel({
    required this.country,
    required this.region,
    required this.lat,
    required this.lon,
    required this.tz_id,
    required this.avgHumidity,
    required this.humidity,
    required this.avgVis_km,
    required this.avgVis_miles,
    required this.pressure_mb,
    required this.pressure_in,
    required this.icon,
    required this.wind_dir,
    required this.cloud,
    required this.wind_degree,
    required this.gust_kph,
    required this.gust_mph,
    required this.is_Day,
    required this.time,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      country: data['location']['country'],
      region: data['location']['region'],
      lat: data['location']['lat'].toString(),
      lon: data['location']['lon'].toString(),
      tz_id: data['location']['tz_id'].toString(),
      date: data['location']['localtime'].toString(),
      avgTemp: jsonData['avgtemp_c'].toString(),
      avgHumidity: jsonData['avghumidity'].toString(),
      avgVis_km: jsonData['avgvis_km'].toString(),
      avgVis_miles: jsonData['avgvis_miles'].toString(),
      is_Day:
          data['forecast']['forecastday'][0]['hour'][0]['is_day'].toString(),
      time: data['forecast']['forecastday'][0]['hour'][0]['time'].toString(),
      humidity:
          data['forecast']['forecastday'][0]['hour'][0]['humidity'].toString(),
      cloud: data['forecast']['forecastday'][0]['hour'][0]['cloud'].toString(),
      pressure_mb: data['forecast']['forecastday'][0]['hour'][0]['pressure_mb']
          .toString(),
      pressure_in: data['forecast']['forecastday'][0]['hour'][0]['pressure_in']
          .toString(),
      wind_dir:
          data['forecast']['forecastday'][0]['hour'][0]['wind_dir'].toString(),
      wind_degree: data['forecast']['forecastday'][0]['hour'][0]['wind_degree']
          .toString(),
      gust_kph:
          data['forecast']['forecastday'][0]['hour'][0]['gust_kph'].toString(),
      gust_mph:
          data['forecast']['forecastday'][0]['hour'][0]['gust_mph'].toString(),
      maxTemp: jsonData['maxtemp_c'].toString(),
      minTemp: jsonData['mintemp_c'].toString(),
      weatherStateName: jsonData['condition']['text'],
      icon: Uri.parse('https:' + jsonData['condition']['icon']).toString(),
    );
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear') {
      return Colors.green;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Cloudy') {
      return Colors.cyan;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Sunny' ||
        weatherStateName == 'Overcast') {
      return Colors.yellow;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Light rain shower') {
      return Colors.deepOrange;
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder' ||
        weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Partly cloudy') {
      return Colors.brown;
    } else if (weatherStateName == 'Moderate rain') {
      return Colors.red;
    } else {
      return Colors.blueGrey;
    }
  }
}
