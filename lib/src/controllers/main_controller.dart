//Here the main controller
import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyClass extends StatefulWidget {
  const MyClass({super.key});

  @override
  State<MyClass> createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MainController {
  static DatosUsuarios? usuaria;
  //mySetState es una variable que se usa para actualizar el estado de un widget desde otra clase
  static State<MyClass> mySetState  = const MyClass().createState();

  static Color barColor = const Color.fromRGBO(255, 198, 187, 1);

  static String moverLetra(String p){
    return p.isNotEmpty ? p.substring(0, 1).toUpperCase() + p.substring(1) : '';

  }

  static void reiniciarApp(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      // Elimina todas las rutas anteriores y agrega la nueva
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
      (Route<dynamic> route) => false, // Elimina todas las rutas anteriores
    );
  }

  static Future<bool> getLogiado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('recordarme') ?? false;
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mensajeInferior(
    BuildContext context,
    String mensaje,
    Color? backgroundColor,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            mensaje,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        backgroundColor: backgroundColor ?? const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
