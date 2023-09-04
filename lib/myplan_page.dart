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
  SnackBar _snackBar1 = SnackBar(content: Text("The plan has been created!"));

  List<Widget> listPlanTiles = []; // List to store ListTile widgets
  List<Widget> listPlaceTiles = [];

  // Controller for the input fields
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  // Function to show a pop-up dialog for user input
  Future<void> _showInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create a New Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                controller: subtitleController,
                decoration: InputDecoration(labelText: 'Subtitle'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                // Create a new ListTile with custom title and subtitle
                // Depending on the active tab choice, add ListTile to the appropriate list
                final activeList =
                    tabList[DefaultTabController.of(context)!.index].title ==
                            'Plans'
                        ? listPlanTiles
                        : listPlaceTiles;

                setState(() {
                  activeList.add(
                    Card(
                      elevation: 5, // Shadow elevation
                      margin: EdgeInsets.all(10), // Margin around the Card
                      child: ListTile(
                        title: Text(titleController.text),
                        subtitle: Text(subtitleController.text),
                      ),
                    ),
                  );
                });

                // Clear the input fields
                titleController.clear();
                subtitleController.clear();

                // Close the dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(FontAwesomeIcons.search),
          //     onPressed: null,
          //   )
          // ],
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
            // Depending on the active tab choice, select the appropriate list
            final activeList =
                choice.title == 'Plans' ? listPlanTiles : listPlaceTiles;

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
                  // Make the list of ListTiles scrollable
                  Expanded(
                      child: SingleChildScrollView(
                          child: Column(
                    children: activeList,
                  ))),
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
            // setState(() {
            //   listTiles.add(
            //     ListTile(
            //       title: Text("New Item"),
            //       subtitle: Text("This is a new item added dynamically."),
            //       leading: Icon(Icons.star), // Customize the leading icon
            //     ),
            //   );
            // });

            // Show the input dialog when the button is pressed
            _showInputDialog(context);
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
