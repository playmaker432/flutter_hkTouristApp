import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyPlan_PageState createState() => _MyPlan_PageState();
}

class _MyPlan_PageState extends State<MyPlanPage> {
  SnackBar _snackBar1 = SnackBar(content: Text("You Click the Button!"));
  List<Widget> listTiles = []; // List to store ListTile widgets

  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        drawer: drawer,
        appBar: AppBar(
          title: Text("My Plans"),
          // leading: Icon(FontAwesomeIcons.dragon),
          actions: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: null,
            )
          ],
          bottom: TabBar(
            tabs: tabList.map((choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabList.map((choice) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 20.0), // S
                  Icon(
                    choice.icon,
                    size: 100.0,
                  ),
                  SizedBox(
                      height: 10.0), // Space between the icon and ListTiles
                  // Display the ListTiles added dynamically
                  Column(children: listTiles),
                ],
              ),
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(_snackBar1);
            // Add a new ListTile when the button is pressed
            setState(() {
              listTiles.add(
                ListTile(
                  title: Text("New Item"),
                  subtitle: Text("This is a new item added dynamically."),
                  leading: Icon(Icons.star), // Customize the leading icon
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

class TabChoice {
  final String title;
  final IconData icon;
  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = const <TabChoice>[
  TabChoice('Plans', Icons.map),
  TabChoice('Bookmarked places', Icons.location_on),
];
