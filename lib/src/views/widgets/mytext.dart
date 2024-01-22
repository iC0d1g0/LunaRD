import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final void Function()? onPressed;
  final bool obsecureText;
  final void Function(String value)? onChanged;
  final String? value;

  const MyText({
    super.key,
    required this.hintText,
    this.icon,
    this.onPressed,
    this.obsecureText = false,
    this.onChanged,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0x00ffcec5).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              controller: TextEditingController(text: value),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  )),
              obscureText: obsecureText,
            ),
          ),
          IconButton(onPressed: onPressed, icon: Icon(icon)),
        ],
      ),
    );
  }
}
