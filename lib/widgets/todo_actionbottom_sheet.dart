import 'package:flutter/material.dart';

class TodoActionsBottomSheet extends StatelessWidget {
  final Function() onPressedEdit;
    final bool isCompleted;
  final Function() onPressedDelete;
    final Function() onPressedCompleteTodo;

  const TodoActionsBottomSheet(
      {super.key, required this.onPressedEdit, 
      required this.onPressedCompleteTodo,
      required this.isCompleted,
      required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 10.0,
        ),
         ListTile(
          leading:  Icon(
            isCompleted ? Icons.radio_button_unchecked_rounded : Icons.check_rounded,
            color: Colors.green,
          ),
          title:  Text(
            isCompleted ? 'Mark as unfinished' : 'Mark as finished'),
          onTap:onPressedCompleteTodo,
        ),
        ListTile(
          leading: const Icon(
            Icons.edit_rounded,
            color: Colors.black,
          ),
          title: const Text('Edit'),
          onTap:onPressedEdit,
        ),
        ListTile(
          leading: const Icon(
            Icons.delete_rounded,
            color: Colors.red,
          ),
          title: const Text('Delete'),
          onTap: onPressedDelete,
        )
      ],
    );
  }
}
