import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';

class WeatherModel {
  String? generalSituation;

  WeatherModel({this.generalSituation});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      WeatherModel(generalSituation: json['generalSituation']);
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherPage> {
  WeatherModel weather_data = new WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh), onPressed: fetchWeatherData),
      drawer: buildDrawer(context),
      body: weather_data.generalSituation != null
          ? Text(weather_data.generalSituation!)
          : Container(),
    );
  }

  void fetchWeatherData() async {
    const String fnwAPI =
        'https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=flw&lang=en';

    print('API: {$fnwAPI} called');

    try {
      var response = await http.get(Uri.parse(fnwAPI));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        WeatherModel weather = WeatherModel.fromJson(jsonResponse);
        setState(() {
          weather_data = weather;
        });
        print(weather.generalSituation);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error connecting to API: $e');
    }
  }
}
