//Dependencies
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

//models
import 'package:luna_rd/src/models/authen_firebase.dart';

//Controllers
import 'package:luna_rd/src/controllers/main_controller.dart';

Future<bool> verificarLogin(context, recordarme, nombre, password) async {
  
  AuthService auth = AuthService();
  User? user;
  try{
    user = await auth.signInWithEmailAndPassword(nombre, password);
  } catch(e) {
    mensajeInferior(context, "Debes llenar los campos", Colors.red);
  }

  if (user != null) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('recordarme', recordarme);
    return true;
  } else {
    return false;
  }
}