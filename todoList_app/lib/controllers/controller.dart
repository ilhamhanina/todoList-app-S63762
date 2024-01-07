/// Author: Ilham Hanina S63762
/// Program: controller.dart for todoList_app
/// Date modified: 7 January 2024
///

import 'package:todoList_app/models/model.dart';

class TodoController {
  List<Todo> todos = [];

  // to add a new todo list
  void addTodo(String title, DateTime dueDate) {
    Todo newTodo = Todo(title: title, dueDate: dueDate);
    todos.add(newTodo);
  }

  //to change the status if the task is completed or not
  void toggleTodoCompletion(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
  }

  //delete a todo item from the list
  void deleteTodo(int index) {
    todos.removeAt(index);
  }
}
