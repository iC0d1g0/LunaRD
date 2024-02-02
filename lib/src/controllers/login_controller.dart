//Dependencies
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

//models
import 'package:luna_rd/src/models/authen_firebase.dart';
//import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
//import 'package:luna_rd/src/models/database/database_services.dart';

//Controllers
import 'package:luna_rd/src/controllers/main_controller.dart';

class LoginController {
  static Future<bool> verificarLogin(
      context, nombre, password) async {
    AuthService auth = AuthService();
    User? user;
    try {
      user = await auth.signInWithEmailAndPassword(nombre, password);
       String? correo=FirebaseAuth.instance.currentUser?.email!;
      
      MainController.usuaria= await MainController.datosUsuariaExistente(correo);
    
    } catch (e) {
      MainController.mensajeInferior(context, "Hubo un Error: $e", Colors.red);
    }

      if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('started', true);
     //prefs.setString('email', nombre);
      return true;
    } else {
      return false;
    }
  }
 static Future<User?> iniciarConFacebook(context)  async {
     AuthService auth = AuthService();
    try {
      // Inicia el proceso de inicio de sesión con Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Verifica si el proceso de inicio de sesión fue exitoso
      if (result.status == LoginStatus.success) {
        // Obtiene las credenciales de inicio de sesión de FacebookAuthProvider
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

        // Inicia sesión con Firebase usando las credenciales de Facebook
         User? user =await auth.signInWithCredencial(facebookAuthCredential);
        

        // Verifica si la autenticación fue exitosa
        if (user != null) {
          //print('Usuario autenticado con éxito: ${user.displayName}');
        }

        return user;
      } else if (result.status == LoginStatus.cancelled) {
        // El usuario canceló el inicio de sesión con Facebook
        throw Exception('Cancelado');
      } else {
        // Ocurrió un error durante el inicio de sesión con Facebook
        //print('Error durante el inicio de sesión con Facebook: ${result.message}');
        throw Exception('Error durantel el inicio');
      }
    } catch (e) {
     // print('Error al autenticar con Facebook: $e');
      throw Exception(e);
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


  }

  static Future<bool> iniciarConGoogle(context) async{
    AuthService auth = AuthService();
    User? user;
    try {
      user = await auth.signInWithGoogle();
      String? correo=FirebaseAuth.instance.currentUser?.email!;
      
      MainController.usuaria= await MainController.datosUsuariaExistente(correo);
    } catch (e) {
      MainController.mensajeInferior(context, "Hubo un Error!: $e", Colors.red);
    }
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('started', true);
      return true;
    } else {
      return false;
    }
  }
 /*
  static Future<User?> iniciarConFacebook(context) async{
    AuthService auth = AuthService();
    User? user;
    try {
      return  await auth.signInWithFacebookandRegister();
    } catch (e) {
      MainController.mensajeInferior(
          context, "Hubo un Error: $e", Colors.red,
      );
    }
    return null;
  }*/

  static void cerrarSesion(context) async {
    AuthService auth = AuthService();
    await auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('started');
    MainController.reiniciarApp(context);
  }
}
