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


class Calendario2 extends StatelessWidget {
  const Calendario2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalendarioMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const Config(),
    );
  }
}
void main() async {
  runApp(const Calendario2());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
