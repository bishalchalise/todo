import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String value;
  final Function()? onPressed;
  const AppButton({Key? key, required this.value, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
    color: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    padding: const EdgeInsets.all(18),
      child: Text(value, style: const TextStyle(color: Colors.white,),
      ),
    );
  }
}
