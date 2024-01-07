/// Author: Ilham Hanina S63762
/// Program: todo_list.dart for todoList_app
/// Date modified: 7 January 2024
///
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoList_app/controllers/controller.dart';
import 'package:todoList_app/widgets/add_list.dart';

class TodoList extends StatefulWidget {
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TodoController todoController = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Todo-List App'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.amber[50],
        child: ListView.builder(
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            //to sort the date depends on their due date priority
            todoController.todos.sort((a, b) => a.dueDate.compareTo(b.dueDate));

            var todo = todoController.todos[index];

            return Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        setState(() {
                          todoController.toggleTodoCompletion(index);
                        });
                      },
                    ),
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration
                                .lineThrough // for crossing out completed task
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      'Due Date: ${DateFormat('dd-MM-yyyy').format(todo.dueDate)}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          todoController.deleteTodo(index);
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      //Button that navigate to the add_list.dart
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddList(todoController: todoController)),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
