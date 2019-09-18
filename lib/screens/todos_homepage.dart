import 'package:flutter/material.dart';
import '../widgets/todo_tile.dart';

class TodosHomepage extends StatefulWidget {
  @override
  _TodosHomepageState createState() => _TodosHomepageState();
}

class _TodosHomepageState extends State<TodosHomepage> {
  List<Map<String, dynamic>> todos = [
    {"title": "Test 1", "description": "abc123 def456", "done": false},
    {"title": "Test 2", "description": "abc123 def456", "done": true},
    {"title": "Test 3", "description": "abc123 def456", "done": false},
    {"title": "Test 4", "description": "abc123 def456", "done": false},
  ];

  void toggleDoneHandler(index, value) {
    setState(() {
      todos[index]['done'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (ctx, i) => TodoItem(
          title: todos[i]['title'],
          done: todos[i]['done'],
          toggleDone: toggleDoneHandler,
          index: i,
        ),
      ),
    );
  }
}
