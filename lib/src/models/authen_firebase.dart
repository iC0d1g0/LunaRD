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
         throw Exception('signInWithEmailAndPassword: $e');
    }
  }
    Future<User?> signInWithCredencial(AuthCredential facebook) async {
    try {
      UserCredential result = await _auth.signInWithCredential(facebook);
      User? user = result.user;
      return user;
    } catch (e) {
         throw Exception('signInWithEmailAndPassword: $e');
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
      throw Exception('registerWithEmailAndPassword: $e');
    }

  }

    //Si olvido contrasenia 
    Future<void> sendPasswordResetEmail(String userEmail) async {
          try {
            await _auth.sendPasswordResetEmail(email: userEmail);
           // print('Correo de restablecimiento de contraseña enviado a $userEmail');
          } catch (e) {
            throw Exception('sendPasswordResetEmail: $e');//Si el correo no existe
          }

          
  }
  //Este metodo hay que usarlo al memomento de enviar el correo.
  Future<void> confirmPasswordResets(String code,String newpassword)async{
    try{
       await _auth.confirmPasswordReset(code:code, newPassword:newpassword );

    }catch(e){
      throw Exception('Error al restablecer la contraseña: $e');
  
    }

  }
    // Otros métodos de autenticación, como signUpWithEmailAndPassword, signInWithGoogle, etc., se pueden agregar según sea necesario.
  
  //Signin con GOOGLE
  Future<User?> signInWithGoogle() async {
    try {
      // Inicia el proceso de inicio de sesión con Google
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // El usuario canceló el inicio de sesión con Google
       throw Exception('Usuario cancelo la autenticacion');
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
      if (user == null) {
        //print('Usuario autenticado con éxito: ${user.displayName}');
        
        throw Exception('Error de autenticacion');
     }
     return user;


      
    } catch (e) {
      throw Exception('Error al iniciar sesión con Google: $e');//Esto hay que manejarlo diferente. 
      
    }
  }
 
  //Registrar con GOOGLE.
  Future<User?> registerWithGoogle() async {
    try {
     
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        
        throw Exception('error de autenticacion: Google');
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
      if (user == null) {
        throw Exception('proeblemas de atenticacion');
      }
        //print('Usuario registrado con éxito: ${user.displayName}');

      return user;
    } catch (e) {
      //print('Error al registrar con Google: $e');
      throw Exception(e);
     }
  }

  // Metodo para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
    await googleSignIn.signOut();
  }
    //Metodo para iniciar seccion y para registrar nuevos usuarios usando la api de facebook
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
  }
}
