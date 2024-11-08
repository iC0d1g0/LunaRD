//Here the main controller
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/models/IA/personal_chat.dart';
//import 'package:luna_rd/src/models/authen_firebase.dart';
import 'package:luna_rd/src/models/database/databa_fire.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainController {
  static DatosUsuarios usuaria = DatosUsuarios();
  static Color barColor = const Color.fromRGBO(255, 198, 187, 1);
  static String respuestaChatInicial = 'ia/Hola soy Eva, ¿Cómo estás hoy?';
  static ChatGPT chatGPT = ChatGPT();

  static Future<DatosUsuarios>datosUsuariaExistente(String? email) async {
     String correo = (email != null) ? email : "";
     Usuario usuarioRecuperado = await obtenerUsuarioDesdeFirestore(correo);
      usuaria.nombre=usuarioRecuperado.nombre;
      usuaria.birthday=usuarioRecuperado.birthday;
      usuaria.correo=usuarioRecuperado.correo;
      usuaria.inicioUltimoPeriodo=usuarioRecuperado.inicioUltimoPeriodo;
      usuaria.finalizoUltimoPeriodo=usuarioRecuperado.finalizoUltimoPeriodo;
      usuaria.duracionUsual=usuarioRecuperado.duracionUsual;
      usuaria.tomasMuchoLiquido=usuarioRecuperado.tomasMuchoLiquido;
       return MainController.usuaria;
    }
 static Future<Usuario> obtenerUsuarioDesdeFirestore(String correo) async {
  try {
    DocumentSnapshot document = await FirebaseFirestore.instance.collection('perfil_usuarios').doc(correo).get();

    if (document.exists) {
      return Usuario.fromFirestore(document);
    } else {
      
      return Usuario(nombre: "", correo: "", birthday: DateTime.now(), inicioUltimoPeriodo: DateTime.now(), finalizoUltimoPeriodo: DateTime.now(), duracionUsual: 0, frecuenciaRelacionesMes: 0, tomasMuchoLiquido: "", createdAt: Timestamp.now());
    }
  } catch (e) {
   
    return Usuario(nombre: "", correo: "", birthday: DateTime.now(), inicioUltimoPeriodo: DateTime.now(), finalizoUltimoPeriodo: DateTime.now(), duracionUsual: 0, frecuenciaRelacionesMes: 0, tomasMuchoLiquido: "", createdAt: Timestamp.now());
  }
  }
  
  static Future<String> respuestaChatGPT(String mensaje) async {  
    String? respuesta = await chatGPT.callAPI(mensaje);
    if (respuesta == null) {
      return 'ia/Lo siento, no puedo responder en este momento. ¿Podrías intentarlo más tarde?';
    }
    final jsonResponse = json.decode(respuesta);
    final resp = jsonResponse['choices'][0]['message']['content'];
    MainController.respuestaChatInicial = 'ia/$resp';
    return 'ia/$resp';
  }

  static void reiniciarApp(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      // Elimina todas las rutas anteriores y agrega la nueva
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
      (Route<dynamic> route) => false, // Elimina todas las rutas anteriores
    );
  }

  static Future<bool> getStarted() async => (await SharedPreferences.getInstance()).getBool('started') ?? false;

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

  static void a(
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
