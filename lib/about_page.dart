import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("About")),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Text("App Name"),
          Image.asset('route_demo.jpg'),
          SizedBox(height: 16),
          Text("Version 1.0.0"),
          SizedBox(height: 16),
          ElevatedButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              })
        ])));
  }
}
