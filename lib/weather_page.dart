import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:intl/intl.dart';

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

  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Icon(
      Icons.star,
      size: 200.0,
    ),
    Icon(
      Icons.mood_bad,
      size: 200.0,
    ),
    Icon(
      Icons.wb_sunny,
      size: 200.0,
    ),
  ];

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
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
              WeatherInfoTile(
                title: 'General Situation',
                content: weather_data.generalSituation ?? '',
              ),
              Divider(), // Add a divider for separation
              WeatherInfoTile(
                title: 'Forecast Period',
                content: weather_data.forecastPeriod ?? '',
              ),
              Divider(),
              WeatherInfoTile(
                title: 'Forecast Description',
                content: weather_data.forecastDesc ?? '',
              ),
              Divider(),
              WeatherInfoTile(
                title: 'Outlook',
                content: weather_data.outlook ?? '',
              ),
              SizedBox(height: 25.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Update Time: ${formatUpdateTime(weather_data.updateTime ?? '')}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.star)),
      //     BottomNavigationBarItem(icon: Icon(Icons.mood_bad)),
      //     BottomNavigationBarItem(icon: Icon(Icons.wb_sunny)),
      //   ],
      // )
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

  String formatUpdateTime(String updateTime) {
    try {
      final parsedDateTime = DateTime.parse(updateTime);
      final formattedDateTime =
          DateFormat('dd-MM-yy, HH:mm:ss').format(parsedDateTime);
      return formattedDateTime;
    } catch (e) {
      return 'N/A';
    }
  }
}

class WeatherInfoTile extends StatelessWidget {
  final String title;
  final String content;

  WeatherInfoTile({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
