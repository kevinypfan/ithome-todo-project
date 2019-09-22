import 'package:flutter/material.dart';
import './screens/todos_homepage.dart';
import 'package:provider/provider.dart';
import './providers/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => Todos(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodosHomepage(),
      ),
    );
  }
}
