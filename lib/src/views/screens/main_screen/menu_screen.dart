import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luna_rd/src/views/screens/main%20screen/calendario_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/chat_ai_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/configuration_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/diagnostico_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/foro_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/historial_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/notas_screen.dart';
import 'package:luna_rd/src/views/screens/main%20screen/preguntas_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(255, 198, 187, 1)));
  runApp(const Menu());
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MenuPrincpal',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const MenuBasico(),
    );
  }
}

class MenuBasico extends StatefulWidget {
  const MenuBasico({super.key});

  @override
  State<MenuBasico> createState() => _MenuBasicoState();
}

class _MenuBasicoState extends State<MenuBasico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(250, 230, 226, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Column(children: [
              const SizedBox(height: 50),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                title: Center(
                  child: Text(
                    'Nombre',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'Estado del usuario',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.black),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Config(),
                      ));
                },
                trailing: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/perfil.png'),
                  backgroundColor: Color.fromRGBO(255, 198, 187, 1),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Calendario(),
                          ));
                    },
                    child: itemDashboard(
                        'Calendario',
                        const DecorationImage(
                            image: AssetImage('assets/images/calendario_.png'),
                            scale: 7),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Foro(),
                          ));
                    },
                    child: itemDashboard(
                        'Foro',
                        const DecorationImage(
                            image: AssetImage('assets/images/foro_.png'),
                            scale: 7),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Diagnostico(),
                          ));
                    },
                    child: itemDashboard(
                        'Diagnostico',
                        const DecorationImage(
                            image: AssetImage('assets/images/consulta.png'),
                            scale: 6),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Historial(),
                          ));
                    },
                    child: itemDashboard(
                        'Historial',
                        const DecorationImage(
                            image: AssetImage('assets/images/historial.png'),
                            scale: 6),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Nota(),
                          ));
                    },
                    child: itemDashboard(
                        'Notas',
                        const DecorationImage(
                            image: AssetImage('assets/images/notas.png'),
                            scale: 6),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Preguntas(),
                          ));
                    },
                    child: itemDashboard(
                        'Preguntas',
                        const DecorationImage(
                            image: AssetImage('assets/images/pregunta.png'),
                            scale: 6),
                        const Color.fromRGBO(255, 198, 187, 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(),
              ));
        },
        elevation: 10,
        highlightElevation: 10,
        backgroundColor: const Color.fromRGBO(255, 198, 187, 1),
        child: const Icon(Icons.chat_rounded),
      ),
    );
  }

  itemDashboard(String title, DecorationImage icondata, Color background) =>
      Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 230, 226, 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: background, image: icondata, shape: BoxShape.circle),
            ),
            const SizedBox(height: 30),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      );
}
