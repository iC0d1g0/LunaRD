import 'package:flutter/material.dart';

class MyButtono extends StatelessWidget {
  final Color customColor;
  final String text;
  final void Function()? onTap;

  const MyButtono({super.key, 
  required this.customColor, 
  required this.text, 
  required this.onTap,
  });

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color: customColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}