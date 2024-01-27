import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

import './src/app.dart';

import 'package:luna_rd/src/controllers/main_controller.dart';

void main() async {

  MainController.mySetState = () {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: MainController.barColor,
      ),
    );  
  } as State<MyClass>;

  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
