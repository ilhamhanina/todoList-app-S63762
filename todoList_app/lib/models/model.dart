/// Author: Ilham Hanina S63762
/// Program: model.dart for todoList_app
/// Date modified: 7 January 2024
///

class Todo {
  String title;
  DateTime dueDate;
  bool isCompleted;

  Todo({
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
  });
}
