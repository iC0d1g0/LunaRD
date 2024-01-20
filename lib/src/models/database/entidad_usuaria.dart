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
  int? _idUsuario,
   _duracionUsual,
    _frecuenciaRelacionesMes;
  String? _nombre,
   _correo, _clave, _createdAt, _birthday,
   _inicioUltimoPeriodo, _finalizoUltimoPeriodo, _tomasMuchoLiquido;

  // Getters
  int? get idUsuario => _idUsuario;
  int? get duracionUsual => _duracionUsual;
  int? get frecuenciaRelacionesMes => _frecuenciaRelacionesMes;
  String? get nombre => _nombre;
  String? get correo => _correo;
  String? get clave => _clave;
  String? get createdAt => _createdAt;
  String? get birthday => _birthday;
  String? get inicioUltimoPeriodo => _inicioUltimoPeriodo;
  String? get finalizoUltimoPeriodo => _finalizoUltimoPeriodo;
  String? get tomasMuchoLiquido => _tomasMuchoLiquido;

  // Setters
  set idUsuario(int? value) {
    _idUsuario = value;
  }

  set duracionUsual(int? value) {
    _duracionUsual = value;
  }

  set frecuenciaRelacionesMes(int? value) {
    _frecuenciaRelacionesMes = value;
  }

  set nombre(String? value) {
    _nombre = value;
  }

  set correo(String? value) {
    _correo = value;
  }

  set clave(String? value) {
    _clave = value;
  }

  set createdAt(String? value) {
    _createdAt = value;
  }

  set birthday(String? value) {
    _birthday = value;
  }

  set inicioUltimoPeriodo(String? value) {
    _inicioUltimoPeriodo = value;
  }

  set finalizoUltimoPeriodo(String? value) {
    _finalizoUltimoPeriodo = value;
  }

  set tomasMuchoLiquido(String? value) {
    _tomasMuchoLiquido = value;
  }
}

     

