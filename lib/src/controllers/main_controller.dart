//Here the main controller
import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  static DatosUsuarios usuaria = DatosUsuarios();
  //mySetState es una variable que se usa para actualizar el estado de un widget desde otra clase
  static State<MyClass> mySetState = const MyClass().createState();

  static Color barColor = const Color.fromRGBO(255, 198, 187, 1);

  static String moverLetra(String p) {
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

  static Future<bool> getLogiadoOInicializado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool started = prefs.getBool('started') ?? false;
    bool recordarme = prefs.getBool('recordarme') ?? false;
    return started || recordarme;
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      mensajeInferior(
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

  static void notificacionVariableTemporal(
      BuildContext context, int tiempo, String clave, String mensaje) async {
    try {
      // Programar una notificación local que se ejecute después de X segundos
      // y que llame a la función deleteValue
      FlutterLocalNotificationsPlugin notifications =
          FlutterLocalNotificationsPlugin();
      await notifications.zonedSchedule(
        0,
        'Notificación',
        mensaje,
        tz.TZDateTime.now(tz.local).add(Duration(seconds: tiempo)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel id',
            'channel name',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: clave,
      );
      // ignore: use_build_context_synchronously
      await deleteValue(context, clave);
    } catch (e) {
      // Manejar el error
      // ignore: use_build_context_synchronously
      mensajeInferior(context, "Hubo un Error: $e", Colors.red);
    }
  }

// Crear una función para borrar el valor booleano
  static Future<void> deleteValue(BuildContext context, String payload) async {
    try {
      // Obtener la instancia de preferencias compartidas
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Borrar el valor booleano asociado a la clave
      await prefs.remove(payload);

      // Actualizar el estado de la variable
      /* setState(() {
        value = prefs.getBool(key) ?? false;
      }); */
    } catch (e) {
      // Manejar el error
      // ignore: use_build_context_synchronously
      mensajeInferior(context, "Hubo un Error: $e", Colors.red);
    }
  }
}
