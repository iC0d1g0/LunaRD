import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:luna_rd/src/app.dart';

//import 'package:luna_rd/src/views/screens/login_register/banco_screen.dart';
import 'firebase_options.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';



void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
