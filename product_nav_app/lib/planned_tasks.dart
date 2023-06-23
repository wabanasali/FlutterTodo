import 'package:flutter/material.dart';
class Planned_tasks extends StatelessWidget {
  const Planned_tasks({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.abc_sharp),
          title: Padding(
            padding: const EdgeInsets.only(left:8),
            child: Text('House cleaned'),
          ),
          trailing: Icon(Icons.more_vert_rounded),
        ),
        ListTile(
          leading: Icon(Icons.abc_sharp),
          title: Padding(
            padding: const EdgeInsets.only(left:8),
            child: Text('Food cooked'),
          ),
          trailing: Icon(Icons.more_vert_rounded),
        ),
      ],
    ),
  );
}
