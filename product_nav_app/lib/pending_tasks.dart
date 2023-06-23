import 'package:flutter/material.dart';
class Pending_tasks extends StatelessWidget {
  const Pending_tasks({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      padding: const EdgeInsets.all(8),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.abc_sharp),
          title: Padding(
            padding: EdgeInsets.only(left:8),
            child: Text('House cleaned'),
          ),
          trailing: Icon(Icons.more_vert_rounded),
        ),
        ListTile(
          leading: Icon(Icons.abc_sharp),
          title: Padding(
            padding: EdgeInsets.only(left:8),
            child: Text('Food cooked'),
          ),
          trailing: Icon(Icons.more_vert_rounded),
        ),
      ],
    ),
  );
}