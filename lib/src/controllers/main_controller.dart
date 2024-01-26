//Here the main controller
import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController {
  static Color barColor = const Color.fromRGBO(255, 198, 187, 1);

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
