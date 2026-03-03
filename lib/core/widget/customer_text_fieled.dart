import 'package:flutter/material.dart';

class CustomerTextFieled extends StatelessWidget {
  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Color? color;
  final Color? fillColor;
  final bool? filled;
  final String? Function(String?)? validator;
  const CustomerTextFieled({
    super.key,
    this.controller,
    this.fillColor,
    this.filled,
    this.color,
    this.validator,
    required this.title,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(backgroundColor: color),
      controller: controller,

      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hint: Text(title, style: TextStyle(color: Colors.black)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
