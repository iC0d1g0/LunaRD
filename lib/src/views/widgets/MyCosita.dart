import 'package:flutter/material.dart';

class MyCosita extends StatelessWidget {
  final Color customColor;
  // ignore: non_constant_identifier_names
  final Color ColorText;
  final String text;
  final void Function()? onTap;

  const MyCosita({
    super.key,
    required this.customColor,
    required this.text,
    // ignore: non_constant_identifier_names
    required this.onTap,
    required this.ColorText,
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
              color: ColorText,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
