import 'package:flutter/material.dart';

//Widgets
import '../widgets/menu_inferior.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String routeName = "/";

  final List<String> meses = [ 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Nov', 'Dic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFFF8692),
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/gotaCirculo.png',
                  scale: 0.9,
                  height: 300,
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text('${DateTime.now().day} ${(DateTime.now().month == 12) ? meses[1] : meses[DateTime.now().month]}.',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      )),
                ),
                const Center(
                  child: Text('Siguiente Periodo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        height: 1,
                      )),
                ),
                const SizedBox(height: 20),
                /* ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login'),
                ), */
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MenuInferior(index: 2),
    );
  }
}