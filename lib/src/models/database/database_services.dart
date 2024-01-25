//import 'package:convert/convert.dart';
import 'package:luna_rd/src/models/database/entidad_usuaria.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'databa_fire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//Este OBJETO ES PARA USO DEL CONTROLADOR, PUEDES LLAMAR TODAS LAS FUNCIONES 
class SQLHelper {
 static Future<void> createTableLogin(sql.Database database) async {
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
  }

  static Future<void> createDatosPersonales(sql.Database database) async {
    await database.execute("""
    CREATE TABLE Datos_user(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      id_usuario int,
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

  static Future<int> createDatos(DatosUsuarios datos) async {
    final db = await SQLHelper.db();
    final data = {
      'id_usuario': datos.idUsuario,
      'birthday': datos.birthday,
      'clave': datos.clave,
      'inicio_ultimo_preriodo': datos.inicioUltimoPeriodo,
      'finalizo_ultimo_periodo': datos.finalizoUltimoPeriodo,
      'duracion_usual': datos.duracionUsual,
      'frecuencia_relaciones_mes': datos.frecuenciaRelacionesMes,
      'tomas_mucho_liquido': datos.tomasMuchoLiquido,
      'createdAt': datos.createdAt,
    };

    final id =
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
  

    return id;
  }

  static Future<int> updateDatos(DatosUsuarios datos) async {
    final db = await SQLHelper.db();
    
    final data = {
      'birthday': datos.birthday,
      'clave': datos.clave,
      'inicio_ultimo_preriodo': datos.inicioUltimoPeriodo,
      'finalizo_ultimo_periodo': datos.finalizoUltimoPeriodo,
      'duracion_usual': datos.duracionUsual,
      'frecuencia_relaciones_mes': datos.frecuenciaRelacionesMes,
      'tomas_mucho_liquido': datos.tomasMuchoLiquido,
      'createdAt': datos.createdAt,
    };
    final result = await db.update('Datos_user', data, where: "id_usuario = ?", whereArgs: [datos.idUsuario]);
    return result;
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ddbb.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        //await createTableLogin(database);
        await createDatosPersonales(database);
      },
      onUpgrade: (sql.Database db, int oldVersion, int newVersion) async {
        // Implementar actualizaciones de la base de datos si es necesario
      },
    );
  }

  //Si el usuario ya existe, pues llamas esta funcion y le pasas por parametro el correo. 
  static Future<void> sincronizaExistente(String correo)async{
   
              // Ejemplo de uso
              String correoBuscado = correo;
              Usuario? usuario = await obtenerUsuarioPorCorreo(correoBuscado);

              if (usuario != null) {
                // Accede a los datos del usuario
                db();
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
                // Accede a otros campos según sea necesario...
              } else {
                throw Exception('Usuario no encontrado');
              }
        }

  
}
