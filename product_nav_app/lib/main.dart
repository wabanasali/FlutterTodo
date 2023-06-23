import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:product_nav_app/add_page.dart';
import 'package:product_nav_app/pending_tasks.dart';
import 'package:product_nav_app/planned_tasks.dart';
import 'package:http/http.dart' as http;

import 'completed_tasks.dart';
void main(){
  runApp(TodoApp());
}

class TodoData{
  var myTodo = 'clean kitchen';
  TodoData(this.myTodo);
}





class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState(){
    super.initState();
    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoApp'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            //iterate and get children
            Text('Planned'),
            Text('Completed'),
            Text('Pending')
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          //in principle we should iterate to pic the children
          Planned_tasks(),
          Completed_Tasks(),
          Pending_tasks()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        //child: Icon(Icons.add, size: 32),
        onPressed: navigateToAddPage,
        label: Text('Add Todo'),
        icon: Icon(Icons.add, size: 32),

      ),
    );
  }
  //route to the add page
  void navigateToAddPage(){
    final route = MaterialPageRoute(
        builder: (context) => AddPage()
    );
    Navigator.push(context, route);
  }
  // //route to the planned_task page
  // void navigateToCompletedTaskPage(){
  //   final route = MaterialPageRoute(builder: (context)=>Completed_Tasks(data:TodoData('Buy Food')));
  //   Navigator.push(context, route);
  // }
  //get data from the backend

}

