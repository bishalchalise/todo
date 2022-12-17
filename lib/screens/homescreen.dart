import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/screens/view_more_screen.dart';
import 'package:todoapp/widgets/appbutton.dart';
import 'package:todoapp/widgets/completed_viewmore.dart';
import 'package:todoapp/widgets/create_todo_bottomSheet.dart';

import '../models/todo_model.dart';
import '../widgets/horizontallist_container.dart';
import '../widgets/todo_list.dart';
import '../widgets/todo_list_horizontal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];

  void createTodo(final Todo todo) {
    setState(() {
      _todos.add(todo);
    });

    final todosCollection = FirebaseFirestore.instance.collection('todos');

    Map<String, dynamic> data = {
      'title': todo.title,
      'description': todo.description,
    };

    todosCollection.add(data);
  }

  void updateTodo(final Todo todo) {
    final index = _todos.indexWhere((element) => element.id == todo.id);
    setState(() {
      _todos[index] = todo;
    });
  }

  void deleteTodo(final Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  void getTodos() async {
    final todosCollection = FirebaseFirestore.instance.collection('todos');
    final result = await todosCollection.get();

    final documents = result.docs;
    for (final document in documents) {
      final data = document.data();
      final todo = Todo(
        id: '12344',
        title: data['title'],
        description: data['description'],
        category: 'personal',
        dateTime: DateTime.now(),
        isCompleted: false,
      );
      setState(() {
        _todos.add(todo); 
      });
    }

  }

@override
  void initState() {
    super.initState();
    getTodos(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text(
      //     'Completed',
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 16.0,
      //     ),
      //   ),
      //   elevation: 0,
      //   actions: [
      //     TextButton(
      //       onPressed: () {},
      //       child: const Text('View More'),
      //     ),
      //   ],
      // ),
      body: _todos.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Todo is empty',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text(
                      'Press Create New on the Bottom Part To Create a ToDo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                const HorizontalContainer(),
                const Expanded(
                  child: TodoListHorizontal(),
                ),
                const SizedBox(
                  height: 10,
                ),
                CompletedViewMore(
                  firstText: 'Completed',
                  lastText: 'View More',
                  onTap: () async {
                    List<Todo> updatedList = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ViewMoreTodoScreen(
                            todos: _todos,
                          );
                        },
                      ),
                    );
                    setState(() {
                      _todos = updatedList;
                    });
                  },
                ),
                Expanded(
                  child: TodoList(
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
                                updateTodo(todo);
                              } else {
                                createTodo(todo);
                              }
                            },
                          );
                        },
                      );
                    },
                    onPressedDelete: (Todo todo) {
                      Navigator.pop(context);
                      deleteTodo(todo);
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
                    todos: _todos,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AppButton(
          color: Colors.blue,
          value: "Create New",
          onPressed: () {
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
                  onPressedCreate: (Todo todo, bool isEditing) {
                    createTodo(todo);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
