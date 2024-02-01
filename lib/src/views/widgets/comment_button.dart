import 'package:flutter/material.dart';

class CommentBoutton extends StatelessWidget {
  final Function()? onTap;
  const CommentBoutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: const Icon(
        Icons.comment,
        color: Color.fromARGB(220,63,7,43),
      ),
    );
    
  }
}