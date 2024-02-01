import 'package:cloud_firestore/cloud_firestore.dart';
// ESTE METODO ES SOLO PARA USO EXCLUSIVO DEL BACKEND oSEA YO ICODIGO. 
class Usuario {
  String nombre;
  String correo;
  DateTime birthday;
  DateTime inicioUltimoPeriodo;
  DateTime finalizoUltimoPeriodo;
  int duracionUsual;
  int frecuenciaRelacionesMes;
  String tomasMuchoLiquido;
  Timestamp createdAt;

  Usuario({
    required this.nombre,
    required this.correo,
    required this.birthday,
    required this.inicioUltimoPeriodo,
    required this.finalizoUltimoPeriodo,
    required this.duracionUsual,
    required this.frecuenciaRelacionesMes,
    required this.tomasMuchoLiquido,
    required this.createdAt,
  });
    Usuario.fromFirestore(DocumentSnapshot document)
      : nombre = document['nombre'],
        correo = document['correo'],
        birthday = (document['birthday'] as Timestamp).toDate(),
        inicioUltimoPeriodo = (document['inicio_ultimo_preriodo'] as Timestamp).toDate(),
        finalizoUltimoPeriodo = (document['finalizo_ultimo_periodo'] as Timestamp).toDate(),
        duracionUsual = document['duracion_usual'] ?? 0,
        frecuenciaRelacionesMes = document['frecuencia_relaciones_mes'] ?? 0,
        tomasMuchoLiquido = document['tomas_mucho_liquido'] ?? '',
        createdAt = document['createdAt'];

}


Future<Usuario?> obtenerUsuarioPorCorreo(String correo) async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Realiza una consulta para obtener el documento con el correo especificado
    DocumentSnapshot document = await firestore.collection('perfil_usuarios').doc(correo).get();

    if (document.exists) {
      // Si el documento existe, devuelve un objeto Usuario construido desde el documento
      return Usuario.fromFirestore(document);
    } else {
      // Si el documento no existe, devuelve null
      return null;
    }
  } catch (error) {
    throw Exception('usuario no identificado');
    
  }
}
Future<void> agregarUsuarioFirestore(Usuario usuario) async {
  
  try {
    // Accede a la instancia de Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    // Agrega un nuevo documento a la colección 'perfil_usuarios' con el correo del usuario como ID
    await firestore.collection('perfil_usuarios').doc(usuario.correo).set({
      'nombre': usuario.nombre,
      'correo': usuario.correo,
      'birthday': usuario.birthday,
      'inicio_ultimo_preriodo': usuario.inicioUltimoPeriodo,
      'finalizo_ultimo_periodo': usuario.finalizoUltimoPeriodo,
      'duracion_usual': usuario.duracionUsual,
      'frecuencia_relaciones_mes': usuario.frecuenciaRelacionesMes,
      'tomas_mucho_liquido': usuario.tomasMuchoLiquido,
      'createdAt': usuario.createdAt,
    });

    
  } catch (error) {
   throw Exception('Error en la sincronizacion con la nube');
  }
}
Future<bool> existenciaUsuario({required String email})async{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
    
  final existingDoc = await firestore.collection('perfil_usuarios').doc(email).get();

    if (existingDoc.exists) {
      // Manejar la existencia del documento, por ejemplo, lanzar una excepción
      return true;
    }
    return false;
}

//FORO DE LUNA, METODOS
 //post Message 
 
  Future<void> postMessage(String currentUsers,String post)async {
    //final currentUser = FirebaseAuth.instance.currentUser!;
    //solo postear si hay algo en el TextField
    if(post.isNotEmpty){
        //subir a firebase
         await FirebaseFirestore.instance.collection('foro_luna').add({
          'UserEmail':currentUsers,
          'Message' : post,
          'TimeStamp': Timestamp.now(),
          'Likes': [],
        });
    }

  }
  //agregar comentarios
    Future<void> addComments(String commentText, String email, String postId) async {
    //escribir el comentario a firestore bajo los comentaris para este post
    await FirebaseFirestore.instance
    .collection("User Post")
    .doc(postId)
    .collection("Comments")
    .add({
    "CommentText": commentText,
    "CommentBy": email,
    "CommentTime": Timestamp.now() //recodar darle formato para usar
    });

  }
     Future<void>  addCommentstoComments(String commentToCommentText, String postId, String email)async {
      
            //primero eliminar comentario de firestire(si solo elimnas el post los comentarios seguiran en la base de datos)
            await FirebaseFirestore.instance
            .collection('User Post')
            .doc(postId)
            .collection('Comments').add({
              "CommentText": commentToCommentText,
              "CommentBy": email,
              "CommentTime": Timestamp.now() //recodar darle formato para usar
            });
         
  }

/*void main() {
  // Ejemplo de uso
  Usuario nuevoUsuario = Usuario(
    nombre: 'Nombre Usuario',
    correo: 'correo@example.com',
    birthday: DateTime.now(),
    inicioUltimoPeriodo: DateTime.now(),
    finalizoUltimoPeriodo: DateTime.now(),
    duracionUsual: 7,
    frecuenciaRelacionesMes: 2,
    tomasMuchoLiquido: 'No',
    createdAt: Timestamp.now(),
  );

  agregarUsuarioFirestore(nuevoUsuario);
}
*/
