import 'package:flutter/material.dart';
import 'package:product_nav_app/completed_tasks.dart';
import 'package:product_nav_app/pending_tasks.dart';
import 'package:product_nav_app/planned_tasks.dart';

void main() {
  runApp(TodoApp());
}

//palettes that go into the tabs in the TabBar of the AppBar

class palette{
  final tab_names = ['planned','completed', 'pending'];
  //modify the tab_view_content into list views
  final tab_view_content = ['planned tasks', 'completed tasks', 'pending tasks'];
//final tab_view_content = [planned_tasks, completed tasks, pending tasks];

}
//
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              //iterate tab names and inject
              tabs: [ for (final pal in palette().tab_names) Tab(text: pal)],
            ),
          ),
          body: TabBarView(
            children: [
              // for (final contenu in palette().tab_view_content) Center(
              //     child: Text(contenu))
              Planned_tasks(),
              Completed_tasks(),
              Pending_tasks()
            ],
          ),
        ),
      ),
    );
  }
}

