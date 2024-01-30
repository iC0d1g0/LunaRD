//import 'package:convert/convert.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'databa_fire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Este OBJETO ES PARA USO DEL CONTROLADOR, PUEDES LLAMAR TODAS LAS FUNCIONES 
class ManageDatos{

  String formatDateHora2(Timestamp timestamp){
  //TimeStamp es el objeto que traemos de firebase
  //para usarlo, vamos convertirlo a String

  DateTime dateTime = timestamp.toDate();

  //obtener el año 
  String year = dateTime.year.toString();
  //la hora
  String mouth = dateTime.month.toString();
  //el dia
  String day = dateTime.day.toString();
  //hora
  String hora = dateTime.hour.toString();
  //formato final
  
  String formarttedData = '$day/$mouth/$year';

  return formarttedData;

}
  String formatDateHora(Timestamp timestamp){
  //TimeStamp es el objeto que traemos de firebase
  //para usarlo, vamos convertirlo a String

  DateTime dateTime = timestamp.toDate();

  //obtener el año 
  String year = dateTime.year.toString();
  //la hora
  String mouth = dateTime.month.toString();
  //el dia
  String day = dateTime.day.toString();
  //hora
  String hora = dateTime.hour.toString();
  //formato final
  
  String formarttedData = '$day/$mouth/$year/$hora';

  return formarttedData;

}
}
class SQLHelper {
 static ManageDatos manageDatos = ManageDatos();
  //ESTOS METODOS NO SE UTILIZARAN PORQUE SON REMPLAZADOS POR FIREBASE AUTHENTICATION
 /*static Future<void> createTableLogin(sql.Database database) async {
    await database.execute("""CREATE TABLE  usuario_login(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nombre VARCHAR(50),
      correo VARCHAR(50),
      clave VARCHAR(50),
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )"""); //Esta funcion es inecesaria 
  }
  static Future<int> createUsuario(String nombre, String? correo, String clave) async {
    final db = await SQLHelper.db();
    final data = {'nombre': nombre, 'correo': correo, 'clave': clave};
    final id = await db.insert('usuario_login', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateUser(int id, String nombre, String? correo, String clave) async {
    final db = await SQLHelper.db();
    final data = {'nombre': nombre, 'correo': correo, 'clave': clave, 'createdAt': DateTime.now()};
    final result = await db.update('usuario_login', data, where: "id = ?", whereArgs: [id]);
    return result;
  }*/

  static Future<void> createDatosTABLA(sql.Database database) async {
    await database.execute("""
    CREATE TABLE Datos_user(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nombre VARCHAR(50),
      correo VARCHAR(50),

      birthday DATE, 
      inicio_ultimo_preriodo DATE,
      finalizo_ultimo_periodo DATE,
      duracion_usual INT, 
      frecuencia_relaciones_mes INT,
      tomas_mucho_liquido VARCHAR(50),
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
    
  }
 // Si la usuaria es nueva, pues solo tienes que llamar este unico metodo. 
 //Metodo con exteroides. 
  static String formateaFecha(DateTime fecha){
    String day=fecha.day.toString();
    String month=fecha.month.toString();
    String year=fecha.year.toString();
    String fechaFormateada=day+'/'+month+'/'+year;
    return fechaFormateada;
 }
  static Future<int> createDatos(DatosUsuarios datoss) async {
    DatosUsuarios datos =DatosUsuarios();
    datos=datoss;

    final db = await SQLHelper.db();

    final data = {
      'nombre': datos.nombre,
      'correo': datos.correo,
      'birthday': formateaFecha(datos.birthday!),      
      'inicio_ultimo_preriodo':formateaFecha(datos.inicioUltimoPeriodo!),
      'finalizo_ultimo_periodo': formateaFecha(datos.finalizoUltimoPeriodo!),
      'duracion_usual': datos.duracionUsual,
      'frecuencia_relaciones_mes': datos.frecuenciaRelacionesMes,
      'tomas_mucho_liquido': datos.tomasMuchoLiquido,
      

    };
    datos.birthday=formateaFecha(datos.birthday!) as DateTime?;
    datos.inicioUltimoPeriodo=formateaFecha(datos.inicioUltimoPeriodo!) as DateTime?;
    datos.finalizoUltimoPeriodo=formateaFecha(datos.finalizoUltimoPeriodo!) as DateTime?;
    
    await db.insert('Datos_user', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    Usuario nuevoUsuario = Usuario(
    nombre: datos.nombre!,
    correo: datos.correo!,
    birthday: datos.birthday!,
    inicioUltimoPeriodo:datos.inicioUltimoPeriodo!,
    finalizoUltimoPeriodo: datos.finalizoUltimoPeriodo!,
    duracionUsual: 7,
    frecuenciaRelacionesMes: 2,
    tomasMuchoLiquido: 'No',
    createdAt: Timestamp.now(),
    );
 
 
     agregarUsuarioFirestore(nuevoUsuario);
  

    return 0;
  }

  //Para actualizar los datos
  static Future<int> updateDatos(DatosUsuarios datos) async {
    final db = await SQLHelper.db();
    
    final data = {
      ' nombre': datos.nombre,
      'correo': datos.correo,
      'birthday': datos.birthday,     
      'inicio_ultimo_preriodo': datos.inicioUltimoPeriodo,
      'finalizo_ultimo_periodo': datos.finalizoUltimoPeriodo,
      'duracion_usual': datos.duracionUsual,
      'frecuencia_relaciones_mes': datos.frecuenciaRelacionesMes,
      'tomas_mucho_liquido': datos.tomasMuchoLiquido,
      'createdAt': datos.createdAt,
    };
    final result = await db.update('Datos_user', data, where: "correo = ?", whereArgs: [datos.correo]);
    
        Usuario nuevoUsuario = Usuario(
        nombre: datos.nombre!,
        correo: datos.correo!,
        birthday: datos.birthday!,
        inicioUltimoPeriodo:datos.inicioUltimoPeriodo!,
        finalizoUltimoPeriodo: datos.finalizoUltimoPeriodo!,
        duracionUsual: 7,
        frecuenciaRelacionesMes: 2,
        tomasMuchoLiquido: 'No',
        createdAt: Timestamp.now(),
  );
 
     agregarUsuarioFirestore(nuevoUsuario);
    return result;
  }
  //para uso privado
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ddbb.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        //await createTableLogin(database);
        await createDatosTABLA(database);
      },
      onUpgrade: (sql.Database db, int oldVersion, int newVersion) async {
        // Implementar actualizaciones de la base de datos si es necesario
      },
    );
  }

  //Si el usuario ya existe, pues llamas esta funcion y le pasas por parametro el correo. 
  static Future<void> sincronizaExistente(String correo)async{
   
              String correoBuscado = correo;
              Usuario? usuario = await obtenerUsuarioPorCorreo(correoBuscado);

              if (usuario != null) {
               
                DatosUsuarios datos = DatosUsuarios();
                
                datos.nombre = usuario.nombre;
                datos.correo = usuario.correo;
                datos.birthday = usuario.birthday;
                datos.inicioUltimoPeriodo = usuario.inicioUltimoPeriodo;
                datos.finalizoUltimoPeriodo = usuario.finalizoUltimoPeriodo;
                datos.duracionUsual = usuario.duracionUsual;
                datos.frecuenciaRelacionesMes = usuario.frecuenciaRelacionesMes;
                datos.tomasMuchoLiquido = usuario.tomasMuchoLiquido;
                datos.createdAt = usuario.createdAt as String?;
                
                createDatos(datos);  //Aqui creamos la base de datos local y guardamos los datos de la NUBE
              } else {
                throw Exception('Usuario no encontrado');
              }
        }

        //modo de uso: List<DatosUsuarios> datosUsuariosList = await SQLHelper.getDatosUsuarios(); luego recorres datosUsuarioList con un for. 
        //for (DatosUsuarios datosUsuario in datosUsuariosList) { print('Nombre: ${datosUsuario.nombre}');}
       // Accede a los datos según sea necesario
      static Future<List<Usuario>>getDatos()async{
            final db = await SQLHelper.db();
            final List<Map<String, dynamic>> result = await db.query('Datos_user');
            List<Usuario> datosUsuariosList = result.map((map) {
              return Usuario(
               nombre: map['nombre'],
               correo: map['correo'],
               birthday: map['birthday'],
               inicioUltimoPeriodo: map['inicioUltimoPeriodo'], 
               finalizoUltimoPeriodo: map['finalizoUltimoPeriodo'],
               duracionUsual: map['duracionUsual'],
               frecuenciaRelacionesMes: map['frecuenciaRelacionesMes'],
               tomasMuchoLiquido: map['tomasMuchoLiquido'],
               createdAt: map['createdAt']);
            }).cast<Usuario>().toList();
            
            return datosUsuariosList;
        }
       

}
