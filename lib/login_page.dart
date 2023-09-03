import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _Login_PageState();
}

class _Login_PageState extends State<LoginPage> {
  late TextEditingController controller;
  String name = '';

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drawer = buildDrawer(context);

    final body = Center(
      child: Text(
        'Login',
        style: TextStyle(fontSize: 32, color: Colors.blue),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      drawer: drawer,
      body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Text(name),
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            final name = await createPlan();
            if (name == null || name.isEmpty) return;

            setState(() => this.name = name);
          }),
    );
  }

  Future<String?> createPlan() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Name of Plan:'),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'What is it about?'),
            ),
            actions: [
              TextButton(
                child: Text('Submit'),
                onPressed: submit,
              )
            ],
          ));

  void submit() {
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  void submit_demo() {}
}
