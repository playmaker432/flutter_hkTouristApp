import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkModeEnabled = false;
  bool notificationsEnabled = true;
  double textSize = 16.0;
  String appVersion = '0.100.0.1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Text Size'),
            trailing: DropdownButton<double>(
              value: textSize,
              onChanged: (value) {
                setState(() {
                  textSize = 14;
                });
              },
              items: [
                DropdownMenuItem(
                  value: 14.0,
                  child: Text('Small'),
                ),
                DropdownMenuItem(
                  value: 16.0,
                  child: Text('Medium'),
                ),
                DropdownMenuItem(
                  value: 18.0,
                  child: Text('Large'),
                ),
              ],
            ),
          ),
          Divider(),
          // App Version Tile
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('App Version'),
                Text(appVersion), // Replace with the actual app version
              ],
            ),
          ),

          Divider(),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to the privacy policy page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Terms of Service'),
            onTap: () {
              // Navigate to the terms of service page
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              // Sign out the user
            },
          ),
        ],
      ),
    );
  }
}
