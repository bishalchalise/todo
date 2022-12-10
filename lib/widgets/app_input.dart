import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final String hintText;
  final bool isMultiline;
  const AppInput({
    Key? key,
    required this.hintText,
    required this.isMultiline,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        maxLines: isMultiline ? 3 : null ,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
