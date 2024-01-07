/// Author: Ilham Hanina S63762
/// Program: add_list.dart for todoList_app
/// Date modified: 7 January 2024

import 'package:flutter/material.dart';
import 'package:todoList_app/controllers/controller.dart';
import 'package:intl/intl.dart';

class AddList extends StatefulWidget {
  final TodoController todoController;

  AddList({required this.todoController});

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  late TextEditingController titleController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    _selectedDate = DateTime.now();
  }

  //display the date that user can choose as due date
  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.purple,
            colorScheme: ColorScheme.light(primary: Colors.purple),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
      initialDatePickerMode: DatePickerMode.day,
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate =
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day);
      });
    });
  }

  //save new added todo list
  void _saveTodo() {
    if (titleController.text.isEmpty) {
      return;
    }

    widget.todoController.addTodo(titleController.text, _selectedDate);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Add ToDo'),
      ),
      body: Container(
        color: Colors.yellow[50],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Insert your to-do list:'),
              controller: titleController,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No Due Date Chosen'
                        : 'Due Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: () => _presentDatePicker(context),
                  child: Text(
                    'Due Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveTodo,
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
