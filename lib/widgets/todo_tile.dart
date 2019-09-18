import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final int index;
  final String title;
  final bool done;
  final Function toggleDone;

  TodoItem({this.title, this.done, this.toggleDone, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          decoration: done ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: done,
        onChanged: (val) {
          toggleDone(index, val);
        },
      ),
    );
  }
}
