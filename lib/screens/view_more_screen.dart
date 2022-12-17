import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../widgets/create_todo_bottomSheet.dart';
import '../widgets/todo_list.dart';

class ViewMoreTodoScreen extends StatefulWidget {
  final List<Todo> todos;
  const ViewMoreTodoScreen({required this.todos, super.key});

  @override
  State<ViewMoreTodoScreen> createState() => _ViewMoreTodoScreenState();
}

class _ViewMoreTodoScreenState extends State<ViewMoreTodoScreen> {
  List<Todo> _todos = [];


  @override
  void initState() {
    super.initState();
      _todos = widget.todos; 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, _todos);
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
        title: const Text(
          'All Todos',
          style: TextStyle(
              color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: TodoList(
        todos: _todos,
        onPressedEdit: (Todo todo) {
                      Navigator.pop(context);
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        )),
                        builder: (context) {
                          return CreateTodoBottomsheet(
                            todoToEdit: todo,
                            onPressedCreate: (Todo todo, bool isEditing) {
                              if (isEditing) {
                                final index = _todos.indexWhere(
                                    (element) => element.id == todo.id);
                                setState(() {
                                  _todos[index] = todo;
                                });
                              } else {
                                setState(() {
                                  _todos.add(todo);
                                });
                              }
                            },
                          );
                        },
                      );
                    },
                    onPressedDelete: (Todo todo) {
                      Navigator.pop(context);
                      setState(() {
                        _todos.remove(todo);
                      });
                    },
                    onPressedCompeleteTodo: (Todo todo) {
                      Navigator.pop(context);
                      final index =
                          _todos.indexWhere((element) => element.id == todo.id);
                      setState(() {
                        _todos[index] = Todo(
                          id: todo.id,
                          title: todo.title,
                          description: todo.description,
                          category: todo.category,
                          dateTime: todo.dateTime,
                          isCompleted: todo.isCompleted ? false : true,
                        );
                      });
                    },
      ),
    );
  }
}
