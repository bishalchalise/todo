import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_list_items.dart';

import '../models/todo_model.dart';

class TodoList extends StatelessWidget {
   final Function(Todo) onPressedCompeleteTodo; 
  final Function(Todo) onPressedEdit; 
  final Function(Todo) onPressedDelete; 
  final List<Todo> todos;
  const TodoList({
    Key? key,
    required this.todos, 
    required this.onPressedEdit, 
    required this.onPressedDelete, 
    required this.onPressedCompeleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoListItem(
          onPressedCompleteTodo: onPressedCompeleteTodo,
          onPressedEdit: onPressedEdit,
          onPressedDelete: onPressedDelete,
          todo: todo,
        );
      },
    );
  }
}
