import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Buttonn extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  const Buttonn({super.key, required this.text, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
