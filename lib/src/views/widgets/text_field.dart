import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MytextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromRGBO(100, 16, 70, 1)),
      ),
    );
  }
}
