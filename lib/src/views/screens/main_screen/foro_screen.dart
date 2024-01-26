import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';

class Foro extends StatelessWidget {
  const Foro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ForoMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const ForoScreen(),
    );
  }
}

class ForoScreen extends StatefulWidget {
  const ForoScreen({super.key});

  @override
  State<ForoScreen> createState() => _ForoScreen();
}

class _ForoScreen extends State<ForoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyApp(),
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
                      'Foro',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
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
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Escribe tus vivencias',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                    obscureText: false,
                  ),
                ),
                IconButton(
                  onPressed: () {}, //=> print('accion de publicar comentario.'),
                  icon: const Icon(Icons.send),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Posting(
            usuario: 'Usuario',
            descripcion:
                'Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito Pito',
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class Posting extends StatelessWidget {
  final String usuario;
  final String descripcion;
  const Posting({super.key, required this.usuario, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(250, 230, 226, 1),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 196, 184, 1),
                      image: DecorationImage(
                          image: AssetImage('assets/images/perfil.png'))),
                ),
                Text(
                  '   $usuario',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(
                  '   Date  ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(
                  width: 180,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 255, 196, 184),
                      image: const DecorationImage(
                        scale: 20,
                        image: AssetImage('assets/images/me_gusta.png'),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 255, 196, 184),
                      image: const DecorationImage(
                        scale: 15,
                        image: AssetImage('assets/images/comentario.png'),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}