import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luna_rd/src/views/screens/main%20screen/menu_screen.dart';
import 'package:luna_rd/src/views/widgets/chat_context.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 198, 187, 1)));
  runApp(const Chat());
}

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatScreen',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const CharScreen(),
    );
  }
}

class CharScreen extends StatefulWidget {
  const CharScreen({super.key});

  @override
  State<CharScreen> createState() => _CharScreen();
}

class _CharScreen extends State<CharScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ));
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 230, 226, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const Center(
              child: Text(
                'Chat con Eva',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ]),
        ),
      ),
      body: ListView(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
          children: const [
            ChatAI(mensaje: 'puto el que lo lea.'),
            ChatPerson(mensaje: 'te vas a hacer el que no lo leio.'),
            ChatPerson(mensaje: 'te vas a hacer el que no lo leio.'),
            ChatAI(mensaje: 'puto el que lo lea.'),
            ChatPerson(mensaje: 'te vas a hacer el que no lo leio.'),
            ChatAI(mensaje: 'puto el que lo lea.'),
          ]),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(249, 125, 129, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.face_2, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.centerRight,
                width: 300,
                child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Escribiendo...', border: InputBorder.none)),
              ),
            ),
            InkWell(
              onTap: () {}, //=> print('Boton de enviar un mensaje x a la ai Eva'),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.send_rounded, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
