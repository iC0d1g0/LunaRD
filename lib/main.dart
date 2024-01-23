import 'package:flutter/material.dart';
<<<<<<< HEAD
import './src/app.dart';

=======
>>>>>>> 8b16070061ce2f662cc24302eecb6e5abadc1c16
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';

<<<<<<< HEAD
void main() async {
   runApp(const MyApp());
  
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
=======
import './src/app.dart';

void main() async {
  runApp(const MyApp());
>>>>>>> 8b16070061ce2f662cc24302eecb6e5abadc1c16

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
