//Dependencies
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

//models
import 'package:luna_rd/src/models/authen_firebase.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:luna_rd/src/models/database/database_services.dart';

//Controllers
import 'package:luna_rd/src/controllers/main_controller.dart';

class LoginController {
  static Future<bool> verificarLogin(context, recordarme, nombre, password) async {
    AuthService auth = AuthService();
    User? user;
    try {
      user = await auth.signInWithEmailAndPassword(nombre, password);
    } catch (e) {
      MainController.mensajeInferior(
          context, "Debes llenar los campos", Colors.red);
    }

    /*
  // Guardar datos en la tabla de usuarios
  DatosUsuarios usuaria = DatosUsuarios();
    nombre
    correo
    birthday
    clave
    inicioUltimoPeriodo
    finalizoUltimoPeriodo
    duracionUsual
    frecuenciaRelacionesMes
    tomasMuchoLiquido
    createdAt

  usuaria.nombre = user!.displayName;
  usuaria.correo = user.email;
  usuaria.birthday = null;
    */

    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('recordarme', recordarme);
      return true;
    } else {
      return false;
    }
  }
}
