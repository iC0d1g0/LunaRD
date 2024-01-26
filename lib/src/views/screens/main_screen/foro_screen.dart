import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/main%20screen/menu_screen.dart';

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
                  // ignore: avoid_print
                  onPressed: () => print('accion de publicar comentario.'),
                  icon: const Icon(Icons.send),
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const posting(
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

// ignore: camel_case_types
class posting extends StatelessWidget {
  final String usuario;
  final String descripcion;
  const posting({super.key, required this.usuario, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                const SizedBox(width: 10, height: 5),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(255, 196, 184, 1),
                      image: DecorationImage(
                          image: AssetImage('assets/images/perfil.png'))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  usuario,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                descripcion,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Fecha  ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                const SizedBox(
                  width: 140,
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
                    ),
                  ),
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
