
import 'package:flutter/material.dart';

//Screens
import './views/screens/home_screen.dart';
import 'views/screens/login_screen_form.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luna',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFFF8692),
        fontFamily: "Inter",
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreenForm.routeName: (context) => const LoginScreenForm(),
      },
    );
  }

 
}
