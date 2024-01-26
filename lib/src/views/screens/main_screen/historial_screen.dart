import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/main%20screen/menu_screen.dart';
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
                            builder: (context) => const Menu(),
                          ));
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(250, 230, 226, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Historial',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 10,
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
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800)),
            calendarStyle: const CalendarStyle(
                todayTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 40),
          const Text(
            '  Informacion acerca del dia',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 20),
          const sexualesPos(nombre: 'Sexualidad', descripcion: 'descripcion'),
          const SizedBox(height: 10),
          const embarazoPos(nombre: 'Embarazo', descripcion: 'descripcion'),
          const SizedBox(height: 10),
          const anticonceptivosPos(
              nombre: 'Anticonceptivos', descripcion: 'descripcion'),
          const SizedBox(height: 10),
          const malentendidoPos(
              nombre: 'Malestares', descripcion: 'descripcion'),
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
          color: const Color.fromRGBO(250, 230, 226, 1),
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
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 18, color: Colors.black),
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
  final String descripcion;
  const anticonceptivosPos(
      {super.key, required this.nombre, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(250, 230, 226, 1),
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
                      color: Colors.black,
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
                        color: Color.fromARGB(255, 255, 196, 184),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.baby_changing_station,
                          color: Colors.black, size: 30),
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
          color: const Color.fromRGBO(250, 230, 226, 1),
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
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 10),
                Text('Probavilidad de embarazo alcanzada',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                Icon(
                  Icons.pregnant_woman_outlined,
                  size: 20,
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
                    backgroundColor: Colors.black54,
                    color: Color.fromARGB(255, 255, 196, 184),
                    minHeight: 5,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '20%',
                  style: TextStyle(fontSize: 14, color: Colors.black),
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
  final String descripcion;
  const malentendidoPos(
      {super.key, required this.nombre, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(250, 230, 226, 1),
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
                      color: Colors.black,
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
                        color: Color.fromARGB(255, 255, 196, 184),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(Icons.personal_injury,
                          color: Colors.black, size: 30),
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
