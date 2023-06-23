
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //two controllers to capture the values in the text fields
  //title controller
  TextEditingController titleController = TextEditingController();
  //description controller
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
            controller: descriptionController,
          ),
          SizedBox(height: 25),
          ElevatedButton(
              onPressed: submitTodo,
              child: Text('Submit'),
          )
        ],
      ),
    );
  }
  //submitting data to the backend
  Future<void> submitTodo() async
  {
    //submit todo_to_the database in 3 steps

    //get data from the form
    final title = titleController.text;
    final description = descriptionController.text;
    final request_body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //submit the data to the database
    final url = 'http://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
        uri,
        body: jsonEncode(request_body),
        headers: {
          'Content-Type':'application/json'
      }
    );
    //give visual feedback to the user
    if (response.statusCode == 201){
      //on success, reset the fields
      titleController.text = '';
      descriptionController.text = '';
      showVisualFeedback('Success');
    }else{
      //Failure
      showErrorFeedback('Failed');
    }
  }

  void showVisualFeedback(String message)
  {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void showErrorFeedback(String message)
  {
    final snackBar = SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
