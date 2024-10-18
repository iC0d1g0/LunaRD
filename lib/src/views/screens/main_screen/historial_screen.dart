import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:table_calendar/table_calendar.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HistorialMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const HistorialScreen(),
    );
  }
}

class HistorialScreen extends StatefulWidget {
  const HistorialScreen({super.key});

  @override
  State<HistorialScreen> createState() => _HistorialScreen();
}

class _HistorialScreen extends State<HistorialScreen> {
  DateTime ahora = DateTime.now();
  // ignore: non_constant_identifier_names
  void _onDaySeleccion(DateTime Dia, DateTime focusDia) {
    setState(() {
      ahora = Dia;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
                      'Historial',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(100, 16, 70, 1),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          TableCalendar(
            focusedDay: ahora,
            firstDay: DateTime.utc(2010, 10, 20),
            lastDay: DateTime.utc(2040, 10, 20),
            headerVisible: true,
            onDaySelected: _onDaySeleccion,
            selectedDayPredicate: (day) => isSameDay(day, ahora),
            availableGestures: AvailableGestures.all,
            headerStyle: const HeaderStyle(
              formatButtonDecoration:  BoxDecoration(
                color: Color.fromRGBO(100, 16, 70, 1),
              ),
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(100, 16, 70, 1),
                  fontWeight: FontWeight.w800),
            ),
            calendarStyle: const CalendarStyle(
              todayTextStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),

              defaultTextStyle :TextStyle(
                
                color:Color.fromRGBO(100, 16, 70, 1),
              ),

              todayDecoration: BoxDecoration(
                color: Color.fromRGBO(173, 28, 122, 1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            '  Informacion acerca del dia',
            style: TextStyle(
                fontSize: 22,
                color: Color.fromRGBO(100, 16, 70, 1),
                fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          const sexualesPos(nombre: 'Sexualidad', descripcion: 'descripcion'),
          const SizedBox(height: 10),
          const embarazoPos(nombre: 'Embarazo', descripcion: 'descripcion'),
          const SizedBox(height: 10),
          const anticonceptivosPos(nombre: 'Anticonceptivos'),
          const SizedBox(height: 10),
          const malentendidoPos(nombre: 'Malestares'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class sexualesPos extends StatelessWidget {
  final String nombre;
  final String descripcion;
  const sexualesPos(
      {super.key, required this.nombre, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 230, 244, 1),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10, width: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  nombre,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 16, 70, 1),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              descripcion,
              style: const TextStyle(
                  fontSize: 18, color: Color.fromRGBO(100, 16, 70, 1)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class anticonceptivosPos extends StatelessWidget {
  final String nombre;
  const anticonceptivosPos({super.key, required this.nombre});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 230, 244, 1),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10, width: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  nombre,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 16, 70, 1),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  // ignore: avoid_print
                  onTap: () => print('hola mundo'),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(225, 187, 212, 1),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.baby_changing_station,
                          color: Color.fromRGBO(100, 16, 70, 1), size: 30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class embarazoPos extends StatelessWidget {
  final String nombre;
  final String descripcion;
  const embarazoPos(
      {super.key, required this.nombre, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(255, 230, 244, 1),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  nombre,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 16, 70, 1),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 10),
                Text('Probavilidad de embarazo alcanzada',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromRGBO(100, 16, 70, 1))),
                Icon(
                  Icons.pregnant_woman_outlined,
                  size: 25,
                  color: Color.fromRGBO(100, 16, 70, 1),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: LinearProgressIndicator(
                    value: .2,
                    backgroundColor: Color.fromRGBO(100, 16, 70, 1),
                    color: Color.fromRGBO(255, 230, 244, 1),
                    minHeight: 5,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '20%',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(100, 16, 70, 1)),
                ),
                SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class malentendidoPos extends StatelessWidget {
  final String nombre;
  const malentendidoPos({super.key, required this.nombre});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(100, 16, 70, 1),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
              width: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 10),
                Text(
                  nombre,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(100, 16, 70, 1),
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                InkWell(
                  // ignore: avoid_print
                  onTap: () => print('hola mundo'),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(100, 16, 70, 1),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.personal_injury,
                          color: Color.fromRGBO(100, 16, 70, 1), size: 30),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
