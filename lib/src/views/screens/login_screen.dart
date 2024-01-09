import 'package:flutter/material.dart';

//Widgets
import '../widgets/menu_inferior.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const Center(
        child: Text('Aquí va el Login'),
      ),
      bottomNavigationBar: const MenuInferior(index: 3), //esto es solo para provar el menu inferior
    );
  }
}