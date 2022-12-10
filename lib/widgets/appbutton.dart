import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String value;
  final bool border;
  final Function()? onPressed;
  final Color color;
  const AppButton({
    super.key,
    required this.value,
    this.onPressed,
    required this.color,
     this.border = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: border? null : color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: border ?
        const BorderSide(
          color: Colors.blue,
          width: 1.0,
        ) : BorderSide.none,
      ),
      padding: const EdgeInsets.all(18),
      child: Text(
        value,
        style: TextStyle(
          color: border ? Colors.blue : Colors.white,
        ),
      ),
    );
  }
}
