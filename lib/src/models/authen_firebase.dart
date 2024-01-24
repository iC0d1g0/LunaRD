import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
 
  //Sigin con EMAIL 
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
  //Registrar con EMAIL
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
  //Signin con GOOGLE
  Future<User?> signInWithGoogle() async {
    try {
      // Inicia el proceso de inicio de sesión con Google
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // El usuario canceló el inicio de sesión con Google
        return null;
      }

      // Obtiene las credenciales de inicio de sesión de Google
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      // Crea un nuevo objeto de credenciales de acceso de GoogleAuthProvider
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Inicia sesión con Firebase usando las credenciales de Google
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      // Verifica si la autenticación fue exitosa
      if (user != null) {
        //print('Usuario autenticado con éxito: ${user.displayName}');
      }

      return user;
    } catch (e) {
      //print('Error al iniciar sesión con Google: $e');//Esto hay que manejarlo diferente. 
      return null;
    }
  }
 
  //Registrar con GOOGLE.
  Future<User?> registerWithGoogle() async {
    try {
     
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        
        return null;
      }

      
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      // Crea un nuevo objeto de credenciales de acceso de GoogleAuthProvider
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Registra al usuario con Firebase usando las credenciales de Google
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      // Verifica si el registro fue exitoso
      if (user != null) {
        //print('Usuario registrado con éxito: ${user.displayName}');
      }

      return user;
    } catch (e) {
      //print('Error al registrar con Google: $e');
      return null;
     }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }

   Future<User?> signInWithFacebookandRegister() async {
    try {
      // Inicia el proceso de inicio de sesión con Facebook
      final LoginResult result = await FacebookAuth.instance.login();

      // Verifica si el proceso de inicio de sesión fue exitoso
      if (result.status == LoginStatus.success) {
        // Obtiene las credenciales de inicio de sesión de FacebookAuthProvider
        final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.token);

        // Inicia sesión con Firebase usando las credenciales de Facebook
        final UserCredential authResult = await _auth.signInWithCredential(facebookAuthCredential);
        final User? user = authResult.user;

        // Verifica si la autenticación fue exitosa
        if (user != null) {
          //print('Usuario autenticado con éxito: ${user.displayName}');
        }

        return user;
      } else if (result.status == LoginStatus.cancelled) {
        // El usuario canceló el inicio de sesión con Facebook
        return null;
      } else {
        // Ocurrió un error durante el inicio de sesión con Facebook
        //print('Error durante el inicio de sesión con Facebook: ${result.message}');
        return null;
      }
    } catch (e) {
     // print('Error al autenticar con Facebook: $e');
      return null;
    }
  }
}
