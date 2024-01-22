import 'package:firebase_auth/firebase_auth.dart';

//models
import 'package:luna_rd/src/models/authen_firebase.dart';

Future<bool> verificarLogin(checkTheBox, nombre, password) async {
  
  AuthService auth = AuthService();
  User? user;
  user = await auth.signInWithEmailAndPassword(nombre, password);

  if (user != null) {
    return true;
  } else {
    return false;
  }
}