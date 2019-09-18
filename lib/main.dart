import 'package:flutter/material.dart';
import './screens/todos_homepage.dart';
import './screens/edit_todo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodosHomepage(),
      routes: {
        // EditTodoScreen.routeName: (ctx) => EditTodoScreen(),
      },
    );
  }
}
