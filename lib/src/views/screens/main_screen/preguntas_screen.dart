import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';

class Preguntas extends StatelessWidget {
  const Preguntas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiagnosticoMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const PreguntasScreen(),
    );
  }
}

class PreguntasScreen extends StatefulWidget {
  const PreguntasScreen({super.key});

  @override
  State<PreguntasScreen> createState() => _PreguntasScreen();
}

class _PreguntasScreen extends State<PreguntasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 230, 244, 1),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApp(),
                        ),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(100, 16, 70, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Color.fromRGBO(255, 230, 244, 1),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Preguntas',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(100, 16, 70, 1),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Sucesos normales',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(100, 16, 70, 1),
              ),
              child: const Column(
                children: [
                  Text(
                    'Mucho sangrado',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(255, 230, 244, 1),
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'En las mujeres mayores en edad reproductiva, los sangrados menstruales abundantes suelen deberse a problemas uterinos. Entre ellos se incluyen los fibromas, los pólipos y la adenomiosis. Pero también hay otros problemas que pueden causar sangrados menstruales abundantes.',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(255, 230, 244, 1)),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Row(
            children: [
              SizedBox(width: 20),
              Text(
                'Sucesos Anormales (Asistencia medica)',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(100, 16, 70, 1),
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(100, 16, 70, 1),
              ),
              child: const Column(
                children: [
                  Text(
                    'Sangre de color extraño',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(255, 230, 244, 1),
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Si notas la sangre menstrual marrón al comienzo o al final de la regla es porque la sangre es más antigua y ha tardado más en salir del útero. El revestimiento del útero se oscurece cuanto más tiempo tarde en salir del cuerpo.',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(255, 230, 244, 1)),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
