import "package:flutter/foundation.dart";

class Todo with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  bool done;

  Todo({this.id, this.title, this.description, this.done});

  void toggleDone() {
    done = !done;
    notifyListeners();
  }
}

class Todos with ChangeNotifier {
  List<Todo> _items = [
    Todo(id: 1, title: "Test1", description: "abc123", done: false),
    Todo(id: 2, title: "Test2", description: "abc123", done: false),
    Todo(id: 3, title: "Test3", description: "abc123", done: false),
    Todo(id: 4, title: "Test4", description: "abc123", done: true),
    Todo(id: 5, title: "Test5", description: "abc123", done: false),
    Todo(id: 6, title: "Test6", description: "abc123", done: true),
    Todo(id: 7, title: "Test7", description: "abc123", done: false),
    Todo(id: 8, title: "Test8", description: "abc123", done: false),
  ];

  List<Todo> get items {
    return [..._items];
  }

  void addTodo(Todo todo) {
    final newTodo = Todo(
      title: todo.title,
      description: todo.description,
      done: false,
    );
    // _items.add(newTodo);
    _items.insert(0, newTodo); // at the start of list
    notifyListeners();
  }

  void deleteTodo(int itemId) {
    final existingTodoIndex = _items.indexWhere((prod) => prod.id == itemId);
    // var existingTodo = _items[existingTodoIndex];
    _items.removeAt(existingTodoIndex);
    notifyListeners();
  }
}
