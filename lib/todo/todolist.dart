import 'package:flutter/material.dart';

import '../todolist/todo.dart';

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      required this.onTodoChanged,
      required this.removeTodo})
      : super(key: ObjectKey(todo));
  final Todo todo;
  final void Function(Todo todo) onTodoChanged;
  final void Function(Todo todo) removeTodo;

  TextStyle? _getStyle(bool checked) {
    if (!checked) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        onTodoChanged(todo);
      },
      onTap: () {},
      leading: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          onTodoChanged(todo);
        },
      ),
      title: Row(
        children: [
          Text(
            todo.name,
            style: _getStyle(todo.completed),
          ),
          IconButton(
            onPressed: () {
              removeTodo(todo);
            },
            icon: const Icon(Icons.delete),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
