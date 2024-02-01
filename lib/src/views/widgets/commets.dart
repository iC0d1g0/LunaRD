import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  final String text;
  final String user;
  final String time;

  const Comments({
    super.key,
    required this.text,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 240, 244, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //comment
        Text(
          text,
          style: const TextStyle(
              fontSize: 16,
              color: Color.fromRGBO(100, 16, 70, 1),
              fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 5),
        //user,time
        Row(
          children: [
            Text(
              user,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
            ),
            const Text(
              " . ",
              style: TextStyle(
                  fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
            ),
            Text(
              time,
              style: const TextStyle(
                  fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
            ),
          ],
        ),
      ]),
    );
  }
}
