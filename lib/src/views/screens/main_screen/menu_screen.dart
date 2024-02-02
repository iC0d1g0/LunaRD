// Dependencias
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:flutter/services.dart';

// Screens
import 'package:luna_rd/src/views/screens/main_screen/calendario_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/chat_ai_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/configuration_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/diagnostico_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/foro_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/historial_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/notas_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/preguntas_screen.dart';

// Controllers
import 'package:luna_rd/src/controllers/main_controller.dart';

/*
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(255, 198, 187, 1))
  );
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
*/

class MenuBasico extends StatefulWidget {
  const MenuBasico({super.key});

  static const String routeName = "/menu_basico";

  @override
  State<MenuBasico> createState() => _MenuBasicoState();
}

class _MenuBasicoState extends State<MenuBasico> {
  Future<void> verificarLogiado() async => !(await MainController.getStarted())
      ? WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.pushNamed(context, '/login'))
      : null;

  @override
  void initState() {
    super.initState();
    verificarLogiado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 230, 244, 1),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(100, 16, 70, 1),
              borderRadius: BorderRadius.only(),
            ),
            child: Column(children: [
              const SizedBox(height: 50),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                title: const Center(
                  child: Text('Nombre',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(255, 230, 244, 1),
                          fontWeight: FontWeight.w800)),
                ),
                subtitle: const Center(
                  child: Text(
                    'Estado del usuario',
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(255, 230, 244, 1)),
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
                  backgroundColor: Color.fromRGBO(255, 230, 244, 1),
                ),
              ),
              const SizedBox(height: 20),
            ]),
          ),
          Container(
            color: const Color.fromRGBO(255, 230, 244, 1),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 20,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 30,
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
                            scale: 8),
                        const Color.fromRGBO(255, 230, 244, 1)),
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
                            scale: 8),
                        const Color.fromRGBO(255, 230, 244, 1)),
                  ),
                  InkWell(
                    onTap: () async {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Diagnostico(),
                          )); */
                      
                      const url = 'https://www.humnsa.gob.do/index.php/articulos/item/432-chequeo-ginecologico'; //Aquí va la Uri del Diagnóstico
                      Uri uri = Uri.parse(url);
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri, mode: LaunchMode.externalApplication);
                      } else {
                        throw 'No se puede abrir $url';
                      }
                    },
                    child: itemDashboard(
                        'Diagnostico',
                        const DecorationImage(
                            image: AssetImage('assets/images/consulta.png'),
                            scale: 8),
                        const Color.fromRGBO(255, 230, 244, 1)),
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
                            scale: 8),
                        const Color.fromRGBO(255, 230, 244, 1)),
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
                            scale: 8),
                        const Color.fromRGBO(255, 230, 244, 1)),
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
                            scale: 7),
                        const Color.fromRGBO(255, 230, 244, 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const Chat(),
              ));
        },
        elevation: 10,
        highlightElevation: 10,
        backgroundColor: const Color.fromRGBO(255, 230, 244, 1),
        child: const Icon(
          Icons.chat_rounded,
          color: Color.fromRGBO(100, 16, 70, 1),
        ),
      ),
    );
  }

  itemDashboard(String title, DecorationImage icondata, Color background) =>
      Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(100, 16, 70, 1),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(45),
              decoration: BoxDecoration(
                  color: background, image: icondata, shape: BoxShape.circle),
            ),
            const SizedBox(height: 30),
            Text(title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(255, 230, 244, 1),
                )),
          ],
        ),
      );
}
