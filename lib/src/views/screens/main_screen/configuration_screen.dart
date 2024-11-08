import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/controllers/login_controller.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/models/database/databa_fire.dart';
import 'package:luna_rd/src/models/database/database_services.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConfiguracionoMenu',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(0, 255, 230, 244),
      ),
      home: const ConfigScreen(),
    );
  }
}
Future<String?> retonrnaNombre( )async{
   List<Usuario> datosUsuariosList = await SQLHelper.getDatos();
    String nombre ='Adderlis';
    for (Usuario usuario in datosUsuariosList) {
    nombre= usuario.nombre;
    //String Correo=usuario.correo;
    //DateTime birthday=usuario.birthday;
    // Y así sucesivamente, puedes acceder a las demás propiedades
    return nombre;
  }
  return null;
}

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});
  @override
  State<ConfigScreen> createState() => _ConfigScreen();
}
class DatosConfiguracion{
   final usuarioActual = FirebaseAuth.instance.currentUser!;
     String? getEmail(){
      return usuarioActual.email;
     }
      String? getNombre(){
        MainController.datosUsuariaExistente(getEmail());
       
      return  MainController.usuaria.nombre;
     }

}
class _ConfigScreen extends State<ConfigScreen> {
  DatosConfiguracion miUsuaria=DatosConfiguracion();
  final defaultPadding = 16.0;
  final currentUSer = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 230, 244, 1),
        extendBodyBehindAppBar: true,
        body: Container(
          color: const Color.fromRGBO(255, 230, 244, 1),
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyApp(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(100, 16, 70, 1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Color.fromRGBO(255, 230, 244, 1),
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'Configuracion',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Color.fromRGBO(100, 16, 70, 1),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromRGBO(100, 16, 70, 1),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/perfil.png'),
                                fit: BoxFit.cover),
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 0.1,
                                  blurRadius: 2,
                                  offset: Offset(0, 5))
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          currentUSer.toString(),
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 20,
                              color: const Color.fromRGBO(100, 16, 70, 1),
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Center(
                        child: Text(
                          'Ciclo actual',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(100, 16, 70, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.60,
                builder: (context, scrollController) {
                  return Container(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(100, 16, 70, 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        const Text(
                          'Informacion de usuario',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(255, 230, 244, 1),
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconContainer(const Color.fromRGBO(100, 16, 70, 1),
                                IonIcons.heart, 'Likes', 43),
                            iconContainer(const Color.fromRGBO(100, 16, 70, 1),
                                IonIcons.notifications, 'Avisos', 43),
                            iconContainer(const Color.fromRGBO(100, 16, 70, 1),
                                IonIcons.chatbox, 'apunte', 43),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Opciones de usuario',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(255, 230, 244, 1),
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        lastUpdates('Nombre:${miUsuaria.getNombre()}', 'Gmail :  $currentUSer',
                            'Contraseña: ********'),
                        const SizedBox(height: 40),
                        const Text(
                          'Informacion de Luna',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(255, 230, 244, 1),
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 20),
                        lastUpdates(
                            'Licencia', 'Version', 'Creadores - SolidType'),
                        const SizedBox(height: 50),
                        const Text(
                          'Salir de la cuenta',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(255, 230, 244, 1),
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            LoginController.cerrarSesion(context);
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromRGBO(255, 230, 244, 1),
                            ),
                            child: const Center(
                              child: Text(
                                'Cerrar Sesion',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(100, 16, 70, 1),
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lastUpdates(String nombre, String gmail, String clave) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 230, 244, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nombre,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(100, 16, 70, 1),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                gmail,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(100, 16, 70, 1),
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                clave,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(100, 16, 70, 1),
                    fontWeight: FontWeight.w800),
              ),
            ]),
      ),
    );
  }

  Widget iconContainer(Color color, IconData icono, String titulo, int numero) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(255, 230, 244, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icono,
            color: color,
            size: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numero.toString(),
                style: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                titulo,
                style: const TextStyle(
                    fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
