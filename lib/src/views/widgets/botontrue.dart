import 'package:flutter/material.dart';

class MyButtonTrue extends StatelessWidget {
  final Color customColor;
  final String text;
  final void Function()? onTap;

  const MyButtonTrue({super.key, 
  required this.customColor, 
  required this.text, 
  required this.onTap,
  });

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(12),
          color: customColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color:   Color.fromRGBO(255, 230, 244, 1),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}