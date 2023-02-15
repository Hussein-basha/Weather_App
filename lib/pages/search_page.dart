import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search A City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              WeatherModel? weatherModel =
                  await service.getWeather(cityName: cityName!);
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(
                context,
                listen: false,
              ).weatherData = weatherModel;
              // ignore: use_build_context_synchronously
              Provider.of<WeatherProvider>(
                context,
                listen: false,
              ).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weatherModel =
                      await service.getWeather(cityName: cityName!);
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(
                    context,
                    listen: false,
                  ).weatherData = weatherModel;
                  // ignore: use_build_context_synchronously
                  Provider.of<WeatherProvider>(
                    context,
                    listen: false,
                  ).cityName = cityName;
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.search,
                ),
              ),
              label: const Text(
                'Search',
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 10,
              ),
              border: const OutlineInputBorder(),
              hintText: 'Enter A Location',
            ),
          ),
        ),
      ),
    );
  }
}
