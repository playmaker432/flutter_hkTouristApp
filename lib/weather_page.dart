import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';

class WeatherModel {
  String? generalSituation;
  String? tcInfo;
  String? forecastPeriod;
  String? forecastDesc;
  String? outlook;
  String? updateTime;

  WeatherModel({
    this.generalSituation,
    this.tcInfo,
    this.forecastPeriod,
    this.forecastDesc,
    this.outlook,
    this.updateTime,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      generalSituation: json['generalSituation'],
      tcInfo: json['tcInfo'],
      forecastPeriod: json['forecastPeriod'],
      forecastDesc: json['forecastDesc'],
      outlook: json['outlook'],
      updateTime: json['updateTime'],
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherPage> {
  WeatherModel weather_data = WeatherModel();

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: fetchWeatherData,
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherInfoCard(
                title: 'General Situation',
                content: weather_data.generalSituation ?? '',
              ),
              SizedBox(height: 16.0),
              WeatherInfoCard(
                title: 'Forecast Period',
                content: weather_data.forecastPeriod ?? '',
              ),
              SizedBox(height: 16.0),
              WeatherInfoCard(
                title: 'Forecast Description',
                content: weather_data.forecastDesc ?? '',
              ),
              SizedBox(height: 16.0),
              WeatherInfoCard(
                title: 'Outlook',
                content: weather_data.outlook ?? '',
              ),
              SizedBox(height: 16.0),
              WeatherInfoCard(
                title: 'Update Time',
                content: weather_data.updateTime ?? '',
              ),
            ],
          ),
        ),
      ),
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

class WeatherInfoCard extends StatelessWidget {
  final String title;
  final String content;

  WeatherInfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
