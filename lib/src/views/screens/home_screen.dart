import 'package:flutter/material.dart';

//Widgets
//import '../widgets/menu_inferior.dart';

//Controllers
import '../../controllers/main_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/";

  //final List<String> meses = [ 'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Nov', 'Dic'];

  @override
  Widget build(BuildContext context) {
    if (getLogiado()) {
      Navigator.pushNamed(context, '/login');
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Home Screen'),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
