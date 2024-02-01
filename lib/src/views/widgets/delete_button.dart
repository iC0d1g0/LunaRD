import 'package:flutter/material.dart';

class DeleteBoutton extends StatelessWidget {
  final void  Function()? onTap;
  const DeleteBoutton({
    super.key,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: const Icon(
        Icons.cancel,
        color: Color.fromARGB(220, 63,7,43),
      ),
    );
  }
}