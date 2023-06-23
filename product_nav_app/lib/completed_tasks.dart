import 'package:flutter/material.dart';
import 'package:product_nav_app/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



//stateful equivalence
class Completed_Tasks extends StatefulWidget {
  const Completed_Tasks({super.key});

  @override
  State<Completed_Tasks> createState() => _Completed_TasksState();
}

class _Completed_TasksState extends State<Completed_Tasks> {
  List items = [];
  @override
  void initState(){
    super.initState();
    //cal the method to fetch the todos
    fetchTodo();
    setState(() {
      items;
    });
  }
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
Future<void> fetchTodo() async{
  //fetch todo_from_api
  final url = 'http://api.nstack.in/v1/todos?page=1&limit=10';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  //populate accepted view after house keeping
  if (response.statusCode == 200){
    //success
    final json = jsonDecode(response.body) as Map;
    final result = json['items'] as List;
    // setState(() {
    //   items = result;
    // });
  }else{
    //failure
  }
}