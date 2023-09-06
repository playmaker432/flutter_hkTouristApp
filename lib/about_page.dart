import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: CircularProgressIndicator(),
    // );

    return Scaffold(
        appBar: AppBar(title: Text("About")),
        // body: Center(
        //     child:
        //         Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   // Text("App Name"),
        //   Image.asset('images/route_demo.jpg'),
        //   SizedBox(height: 16),
        //   Text("Version 1.0.0"),
        //   SizedBox(height: 16),
        //   ElevatedButton(
        //       child: Text("Close"),
        //       onPressed: () {
        //         Navigator.pop(context);
        //       })
        // ]))

        body: Center(
          child: Image(image: AssetImage('images/route_demo.jpg')),
        ));
  }
}
