import 'package:flutter/material.dart';
import 'package:todoapp/widgets/appbutton.dart';

import '../widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Completed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('View More'),
          ),
        ],
      ),
      body: const TodoList(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AppButton(
          value: "Create Text",
          onPressed: (){
            print('Create Text Pressed');
          },

        ),
      ),
    );
  }
}
