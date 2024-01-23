/*""" 
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
    """

"""CREATE TABLE  usuario_login(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nombre VARCHAR(50),
      correo VARCHAR(50),
      clave VARCHAR(50),
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
       )"""
*/


class DatosUsuarios {
  int? idUsuario,
   duracionUsual,
    frecuenciaRelacionesMes;
  String? nombre,
   correo, clave, createdAt, birthday,
   inicioUltimoPeriodo, finalizoUltimoPeriodo, tomasMuchoLiquido;

 
}