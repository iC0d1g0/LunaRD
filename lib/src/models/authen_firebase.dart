import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (e) {
      // print("Error en el inicio de sesión: $e");
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (e) {
      // print("Error en el registro: $e");
      return null;
    }

    // Otros métodos de autenticación, como signUpWithEmailAndPassword, signInWithGoogle, etc., se pueden agregar según sea necesario.
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
