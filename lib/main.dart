import 'package:flutter/material.dart';
import 'package:helloworld/login_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bookmarked_page.dart';
import 'about_page.dart';
import 'weather_page.dart';
import 'hkmap_page.dart';
import 'setting_page.dart';
import 'package:helloworld/theme/dark_theme.dart';
import 'package:helloworld/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // -------- OLD theme -----------
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        // primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // -------- NEW theme -----------
      // theme: lightTheme,
      // darkTheme: darkTheme,

      routes: {
        '/': (context) => HomePage(),
        // Change p1 as homepage
        '/hkmap': (context) => HomePage(),
        '/myplans': (context) => MyPlanPage(title: 'My Plans'),
        '/weather': (context) => WeatherPage(),
        '/login': (context) => LoginPage(),
        '/aboutus': (context) => AboutPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Test'),
          accountEmail: Text('userGmail@gmail.com'),
          // currentAccountPicture: Image.asset('assets/waiting.gif'),
          decoration: BoxDecoration(color: Colors.grey),
        ),
        _createDrawerItem(context,
            text: 'Hong Kong Map', icon: Icons.map, route: '/hkmap'),
        _createDrawerItem(context,
            text: 'My Plans',
            icon: FaIcon(FontAwesomeIcons.locationArrow).icon,
            route: '/myplans'),
        _createDrawerItem(context,
            text: 'Weather', icon: Icons.wb_sunny, route: '/weather'),
        _createDrawerItem(context,
            text: 'About', icon: Icons.info, route: '/aboutus'),
        _createDrawerItem(context,
            text: 'Settings', icon: Icons.settings, route: '/settings'),
        _createDrawerItem(context,
            text: 'Login', icon: Icons.login, route: '/login'),
      ],
    ),
  );
}

Widget _createDrawerItem(BuildContext context,
    {required String text, IconData? icon, required String route}) {
  return Container(
      padding: EdgeInsets.all(10),
      child: ListTile(
          leading: icon != null ? Icon(icon) : null,
          title: Text(text),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, route);
          }));
}
