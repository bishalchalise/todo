import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_actionbottom_sheet.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/todo_model.dart';

class TodoListItem extends StatelessWidget {
  final Todo todo;
  final Function(Todo) onPressedDelete;
  final Function(Todo) onPressedCompleteTodo;
  final Function(Todo) onPressedEdit;
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onPressedDelete,
    required this.onPressedEdit,
     required this.onPressedCompleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            )),
            builder: (context) {
              return TodoActionsBottomSheet(
                isCompleted: todo.isCompleted,
                onPressedCompleteTodo: () {
                  onPressedCompleteTodo(todo);
                },
                onPressedEdit: () {
                  onPressedEdit(todo);
                },
                onPressedDelete: () {
                  onPressedDelete(todo);
                },
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: const EdgeInsets.all(
          20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    Text(
                      todo.description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Icon(
                  Icons.check_circle,
                  color: todo.isCompleted ? Colors.blue : Colors.grey.shade400,
                ),
              ],
            ),
            const Divider(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  timeago.format(todo.dateTime),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 20.0,
                      width: 20.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/images/person_2.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/person_1.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.deepOrange,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
