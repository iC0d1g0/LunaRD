import 'package:flutter/material.dart';

class MyCosita extends StatelessWidget {
  final Color customColor;
  final Color colorText;
  final String text;
  final void Function()? onTap;

  const MyCosita({
    super.key,
    required this.customColor,
    required this.text,
    required this.onTap,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: customColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
