import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          HorizontalContainer(),
          const Expanded(
            child: TodoListHorizontal(),
          ),
          const SizedBox(
            height: 10,
          ),
          const CompletedViewMore(
            firstText: 'Completed',
            lastText: 'View More',
          ),
          Expanded(
            child: TodoList(
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
                  onPressedCreate: (Todo todo) {
                    setState(() {
                      _todos.add(todo);
                    });
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
