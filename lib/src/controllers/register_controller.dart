import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/models/authen_firebase.dart';

class RegisterController {
  static Future<User?> registrarConGoogle() async {
    AuthService auth = AuthService();
    User? user = await auth.signInWithGoogle();
    return user;
  }

  static Future<User?> registrarConFacebook() async {
    AuthService auth = AuthService();
    User? user = await auth.signInWithFacebookandRegister();
    return user;
  }

  static Future<User?> registrarUsuario(context, nombre, correo, password, cPassword) async{
    if (password == cPassword) {
      try	{
        AuthService auth = AuthService();
        User? user = await auth.registerWithEmailAndPassword(correo, password);
        MainController.reiniciarApp(context);
        return user;
      } catch (e) {
        if (e.toString().contains("email-already-in-use")) {
          MainController.mensajeInferior(context, "El correo ya está en uso", Colors.red);
          return null;
        } else {
          MainController.mensajeInferior(context, "Por favor, llene todos los campos", Colors.red);
          return null;
        }
      }
    } else {
      MainController.mensajeInferior(context, "Las contraseñas no coinciden", Colors.red);
      return null;
    }
  }
}

/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<User?> googleSignIn() async {
  // Crea una instancia de GoogleSignIn y FirebaseAuth
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Inicia el flujo de inicio de sesión de Google
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // Si el usuario cancela el inicio de sesión, devuelve null
  if (googleUser == null) {
    return null;
  }

  // Obtiene los detalles de autenticación del usuario de Google
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Crea una credencial de Firebase con el token de Google
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Inicia sesión en Firebase con la credencial de Google
  final UserCredential userCredential =
      await firebaseAuth.signInWithCredential(credential);

  // Obtiene el usuario de Firebase
  final User? user = userCredential.user;

  // Si el usuario es nuevo, guarda su uid en las preferencias compartidas
  if (userCredential.additionalUserInfo!.isNewUser) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', user!.uid);
  }

  // Devuelve el usuario de Firebase
  return user;
}
*/