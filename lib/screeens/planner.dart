import 'package:flutter/material.dart';
import 'package:studentapp/todo/todolist.dart';
import 'package:studentapp/todolist/todo.dart';

class Planner extends StatefulWidget {
  const Planner({super.key});

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
  final List<Todo> _todos = <Todo>[];
  final TextEditingController _textEditingController = TextEditingController();

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.completed = !todo.completed;
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.removeWhere((element) => element.name == todo.name);
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(
        Todo(name, false),   
      );
    });
    _textEditingController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
      barrierDismissible:
          false, // if it is true touch outside then it is closed

      context: context,
      builder: (BuildContext context) {
        final ButtonStyle style = ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade100,
            textStyle: const TextStyle(
              fontSize: 20,
            ));
        return AlertDialog(
          title: const Text('Add your daily task'),
          content: TextField(
            controller: _textEditingController,
          ),
          actions: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                // backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  // side: const BorderSide(
                  //   color: Colors.red,
                  // ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textEditingController.text);
              },
              child: const Text('add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
      ),
      body: ListView(
        children: _todos.map((Todo todo) {
          return TodoItem(
            todo: todo,
            onTodoChanged: _handleTodoChange,
            removeTodo: _deleteTodo,
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add a todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
