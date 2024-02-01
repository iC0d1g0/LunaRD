import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obsecureText;
  final TextEditingController controller;

  const MyText({
    super.key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obsecureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 206, 234, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(100, 16, 70, 1),
                    )),
                obscureText: obsecureText,
              ),
            ),
          ),
          IconButton(onPressed: onPressed, icon: Icon(icon)),
        ],
      ),
    );
  }
}
