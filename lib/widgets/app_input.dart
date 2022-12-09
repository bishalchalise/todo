import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade300,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Add Task Name...',
        ),
      ),
    );
  }
}
