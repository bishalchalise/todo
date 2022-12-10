import 'package:flutter/material.dart';

class TodoListHorizontal extends StatefulWidget {
  const TodoListHorizontal({Key? key}) : super(key: key);

  @override
  State<TodoListHorizontal> createState() => _TodoListHorizontalState();
}

class _TodoListHorizontalState extends State<TodoListHorizontal> {
  final PageController _pageController = PageController(
    viewportFraction: 0.7,

  );
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 10,
        controller: _pageController,
        itemBuilder: (context, index)
    {
      return Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue,
      );
    }
    );
  }
}
