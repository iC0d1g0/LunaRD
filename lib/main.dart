import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/views/screens/login_register/banco2_screen.dart';
import 'package:luna_rd/src/views/screens/login_register/banco3_screen.dart';
import 'package:luna_rd/src/views/screens/login_register/banco4_screen.dart';
import 'package:luna_rd/src/views/screens/login_register/banco_screen.dart';
import 'package:luna_rd/src/views/screens/login_register/carga_screen.dart';

import 'package:luna_rd/src/views/screens/login_register/quizpregunta_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/configuration_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/diagnostico_screen.dart';
import 'package:luna_rd/src/views/screens/main_screen/foro_screen.dart';

//import 'package:luna_rd/src/views/screens/login_register/banco_screen.dart';
import 'firebase_options.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';




void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
