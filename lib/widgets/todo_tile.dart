import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../providers/todos.dart';

class TodoTile extends StatelessWidget {
  final SlidableController slidableController;
  TodoTile({this.slidableController});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<Todo>(context, listen: false);
    final todosProvider = Provider.of<Todos>(context);
    return Slidable(
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onWillDismiss: (actionType) {
          if (actionType == SlideActionType.primary) {
            todoProvider.toggleDone();
          } else {
            todosProvider.deleteTodo(todoProvider.id);
          }
          return false;
        },
      ),
      key: Key(todoProvider.id.toString()),
      controller: slidableController,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
          color: Colors.white,
          child: Consumer<Todo>(
            builder: (ctx, todoData, ch) => ListTile(
              title: Text(
                todoData.title,
                style: TextStyle(
                  fontSize: 18,
                  decoration: todoData.done ? TextDecoration.lineThrough : null,
                ),
              ),
              leading: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: todoData.done,
                onChanged: (val) {
                  todoData.toggleDone();
                },
              ),
            ),
          )),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Done',
          color: Colors.green,
          icon: Icons.check,
          onTap: () => todoProvider.toggleDone(),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Share',
          color: Colors.indigo,
          icon: Icons.share,
          onTap: () {
            print('share');
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => todosProvider.deleteTodo(todoProvider.id),
        ),
      ],
    );
  }
}
