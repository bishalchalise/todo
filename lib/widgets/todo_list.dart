import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_list_items.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index)
      {
        return const TodoListItem();
      },
    );
  }
}
