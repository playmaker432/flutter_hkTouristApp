import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Hong Kong Tourist'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.directions),
          onPressed: () {
            // TODO: Handle "Planning route" button press
          },
        ),
        IconButton(
          icon: Icon(Icons.map),
          onPressed: () {
            // TODO: Handle "Map" button press
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // TODO: Handle "Settings" button press
          },
        ),
      ],
    );
  }
}
