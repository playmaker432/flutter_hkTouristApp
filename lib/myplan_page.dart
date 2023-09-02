import 'package:flutter/material.dart';
import 'main.dart';

class MyPlan_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    final body = Center(
      child: Text(
        'My Plans',
        style: TextStyle(fontSize: 32, color: Colors.blue),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('My Plans')),
      drawer: drawer,
      body: body,
    );
  }
}
