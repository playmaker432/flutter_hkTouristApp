import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class MyPlanPage extends StatefulWidget {
//   const MyPlanPage({Key? key}) : super(key: key);

//   @override
//   State<MyPlanPage> createState() => _MyPlan_PageState();
// }

// class _MyPlan_PageState extends State<MyPlanPage> {
//   late TextEditingController controller;
//   String name = '';

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     controller.dispose;
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final drawer = buildDrawer(context);

//     final body = Center(
//       child: Text(
//         'My Plans',
//         style: TextStyle(fontSize: 32, color: Colors.blue),
//       ),
//     );

//     return Scaffold(
//       appBar: AppBar(title: Text('My Plans')),
//       drawer: drawer,
//       body: Container(
//           padding: EdgeInsets.all(32),
//           child: Column(
//             children: [
//               Text(name),
//             ],
//           )),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () async {
//             final name = await createPlan();
//             if (name == null || name.isEmpty) return;

//             setState(() => this.name = name);
//           }),
//     );
//   }

//   Future<String?> createPlan() => showDialog<String>(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: Text('Name of Plan:'),
//             content: TextField(
//               autofocus: true,
//               decoration: InputDecoration(hintText: 'What is it about?'),
//             ),
//             actions: [
//               TextButton(
//                 child: Text('Submit'),
//                 onPressed: submit,
//               )
//             ],
//           ));

//   void submit() {
//     Navigator.of(context).pop(controller.text);
//     controller.clear();
//   }

//   void submit_demo() {}
// }

class MyPlanPage extends StatefulWidget {
  const MyPlanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyPlan_PageState createState() => _MyPlan_PageState();
}

class _MyPlan_PageState extends State<MyPlanPage> {
  SnackBar _snackBar1 = SnackBar(content: Text("You Click the Button!"));

  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        drawer: drawer,
        appBar: AppBar(
          title: Text("AppBar Title"),
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
            child: Icon(
              choice.icon,
              size: 100.0,
            ),
          );
        }).toList()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(_snackBar1);
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
