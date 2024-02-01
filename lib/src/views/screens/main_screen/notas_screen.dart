import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/main_screen/addnota_screen.dart';
import 'package:luna_rd/src/app.dart';

class Nota extends StatelessWidget {
  const Nota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotaMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const NotaScreen(),
    );
  }
}

class NotaScreen extends StatefulWidget {
  const NotaScreen({super.key});

  @override
  State<NotaScreen> createState() => _NotaScreen();
}

class _NotaScreen extends State<NotaScreen> {
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
                      'Notas',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(100, 16, 70, 1),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          const SizedBox(height: 20),
          const ItemNota(
            titulo: 'Hola amigos',
            color: Color.fromRGBO(230, 196, 216, 1),
            dia: '20',
            mes: '01',
            ciclo: 'ovuacion',
            descripcion:
                'Texto, texto, tetoxTexto, texto, tetoxTexto, texto, tetoxTexto, texto, tetoxTexto, texto, tetox',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(100, 16, 70, 1),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddNota(),
              ));
        },
        child: const Icon(Icons.add, color: Color.fromRGBO(255, 230, 244, 1)),
      ),
    );
  }
}

class ItemNota extends StatelessWidget {
  final Color color;
  final String titulo;
  final String descripcion;
  final String dia;
  final String mes;
  final String ciclo;
  const ItemNota(
      {super.key,
      required this.color,
      required this.descripcion,
      required this.dia,
      required this.mes,
      required this.ciclo,
      required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Theme.of(context).primaryColor.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5),
          ]),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(100, 16, 70, 1),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(mes,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(255, 230, 244, 1),
                        fontWeight: FontWeight.w800)),
                Text(dia,
                    style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(255, 230, 244, 1),
                        fontWeight: FontWeight.w800)),
                Text(ciclo,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(255, 230, 244, 1),
                        fontWeight: FontWeight.w800)),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(100, 16, 70, 1),
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    descripcion,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(100, 16, 70, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
