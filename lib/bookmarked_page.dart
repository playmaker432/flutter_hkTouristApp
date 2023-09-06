import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyPlan_PageState createState() => _MyPlan_PageState();
}

class _MyPlan_PageState extends State<MyPlanPage>
    with SingleTickerProviderStateMixin {
  SnackBar _snackBar1 = SnackBar(content: Text("The plan has been created!"));

  // Lists to store ListTile widgets for plans and places
  List<Widget> listPlanTiles = [];
  List<Widget> listPlaceTiles = [];

  // Controller for the input fields and tab controller
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabList.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Card _buildHorizontalCard(String title, String subtitle) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Container(
        height: 100, // Fixed height
        child: ListTile(
          contentPadding: EdgeInsets.all(10), // Adjust padding as needed
          leading: Container(
            width: 80, // Fixed width for the rectangular avatar
            height: double.infinity, // Match the height of the ListTile
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8), // Adjust border radius
                child: Image(
                  image: AssetImage('images/route_demo.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }

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
                // Determine the active list based on the selected tab
                List<Widget> activeList =
                    tabController.index == 0 ? listPlanTiles : listPlaceTiles;

                setState(() {
                  activeList.add(
                    _buildHorizontalCard(
                        titleController.text, subtitleController.text),
                    // Card(
                    //   elevation: 5,
                    //   margin: EdgeInsets.all(10),
                    //   child: ListTile(
                    //     leading: CircleAvatar(
                    //       // Image goes here, you can use AssetImage, NetworkImage, etc.
                    //       backgroundImage: AssetImage('images/route_demo.jpg'),
                    //       radius: 30, // Adjust the size of the image
                    //     ),
                    //     title: Text(titleController.text),
                    //     subtitle: Text(subtitleController.text),
                    //   ),
                    // ),
                  );
                });

                titleController.clear();
                subtitleController.clear();

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

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: Text("My Plans"),
        bottom: TabBar(
          controller: tabController,
          tabs: tabList.map((choice) {
            return Tab(
              text: choice.title,
              icon: Icon(choice.icon),
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // Plans Tab
          Center(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Icon(
                  Icons.map, // Use the icon for plans
                  size: 100.0,
                ),
                SizedBox(height: 10.0),
                // Make the list of ListTiles scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: listPlanTiles, // Display plans list
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bookmarked Places Tab
          Center(
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Icon(
                  Icons.location_on, // Use the icon for places
                  size: 100.0,
                ),
                SizedBox(height: 10.0),
                // Make the list of ListTiles scrollable
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: listPlaceTiles, // Display places list
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(_snackBar1);

          _showInputDialog(context);
        },
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
