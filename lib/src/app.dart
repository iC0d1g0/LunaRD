import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//Controllers
import 'package:luna_rd/src/controllers/main_controller.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

//Screens
// import 'package:luna_rd/src/views/screens/home_screen.dart';
import 'package:luna_rd/src/views/screens/login_register/login_screen_form.dart';
import 'package:luna_rd/src/views/screens/main_screen/menu_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: MainController.getStarted(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se espera la respuesta
        } else {
          if (snapshot.data == null) {
            MainController.reiniciarApp(context);
            return Container(
              color: Colors.white,
              child: const Column(
                children: [
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Cargando...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            );
          } else {
            if (snapshot.data == true) {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(240, 120, 218, 0.91),
                ),
              );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Luna',
                theme: ThemeData(
                  colorSchemeSeed: const Color.fromARGB(255, 250, 204, 244),
                  fontFamily: "Inter",
                ),
                initialRoute: MenuBasico.routeName,
                routes: {
                  MenuBasico.routeName: (context) => const MenuBasico(),
                  LoginScreenForm.routeName: (context) =>
                      const LoginScreenForm(),
                },
              );
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Color(0xFFFAE6E2),
                ),
              );
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Luna',
                theme: ThemeData(
                  colorSchemeSeed: const Color(0xFFFF8692),
                  fontFamily: "Inter",
                ),
                initialRoute: LoginScreenForm.routeName,
                routes: {
                  MenuBasico.routeName: (context) => const MenuBasico(),
                  LoginScreenForm.routeName: (context) =>
                      const LoginScreenForm(),
                },
              );
            }
          }
        }
      },
    );
  }
}
