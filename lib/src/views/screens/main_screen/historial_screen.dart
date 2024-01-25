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
            height: 40,
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
          const SizedBox(
            height: 40,
          ),
          const Text(
            '  Informacion acerca del dia',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 20,
          ),
          const Posting(nombre: 'Sexualidad', descripcion: 'descripcion'),
          const SizedBox(
            height: 10,
          ),
          const Posting(nombre: 'Hidratacion', descripcion: 'descripcion'),
          const SizedBox(
            height: 10,
          ),
          const Posting(nombre: 'Malestares', descripcion: 'descripcion'),
        ],
      ),
    );
  }
}

class Posting extends StatelessWidget {
  final String nombre;
  final String descripcion;
  const Posting({super.key, required this.nombre, required this.descripcion});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
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
                Text(
                  '   $nombre',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              descripcion,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
