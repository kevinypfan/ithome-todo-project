import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../widgets/todo_tile.dart';
import '../screens/edit_todo_screen.dart';
import '../providers/todos.dart';

class TodosHomepage extends StatefulWidget {
  @override
  _TodosHomepageState createState() => _TodosHomepageState();
}

class _TodosHomepageState extends State<TodosHomepage> {
  final SlidableController slidableController = SlidableController();

  @override
  Widget build(BuildContext context) {
    final todosProvider = Provider.of<Todos>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => EditTodoScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todosProvider.items.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: todosProvider.items[i],
          child: TodoTile(slidableController: slidableController),
        ),
      ),
    );
  }
}
