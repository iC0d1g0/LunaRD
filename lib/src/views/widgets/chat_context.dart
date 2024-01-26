import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatAI extends StatelessWidget {
  final String mensaje;
  const ChatAI({super.key, required this.mensaje});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80, bottom: 10),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(250, 230, 226, 1),
              ),
              child: Text(mensaje,
                  style: const TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ),
        )
      ],
    );
  }
}

class ChatPerson extends StatelessWidget {
  final String mensaje;
  const ChatPerson({super.key, required this.mensaje});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 80),
          child: ClipPath(
            clipper: LowerNipMessageClipper(MessageType.send),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 196, 184),
              ),
              child: Text(mensaje,
                  style: const TextStyle(fontSize: 16, color: Colors.black)),
            ),
          ),
        )
      ],
    );
  }
}
