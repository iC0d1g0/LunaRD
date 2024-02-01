import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalendarioMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const CalendarioScreen(),
    );
  }
}




class CalendarioScreen extends StatefulWidget {
  const CalendarioScreen({super.key});
  @override
  State<CalendarioScreen> createState() => _CalendarioScreen();
}

class _CalendarioScreen extends State<CalendarioScreen>{
    final CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if(!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelectd(DateTime? start, DateTime? end, DateTime focusedDay){
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
  
    });
  }

  @override
  Widget build(BuildContext context) {
     DateTime now = DateTime.now();
     String mesActual = obtenerMesActual(now.month);

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
                          builder: (context) => const MyApp(),
                        ));
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(220, 251, 225,242),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 86, 47,92),
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Calendario',
                    style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 86, 47,92),
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:const  Color.fromARGB(255, 239, 209, 203),
                      ),
                      child: const Text(
                        'Mestruacion',
                        style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 86, 47,92)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(220, 251, 225,242)),
                      child: const Text(
                        'Ovulacion',
                        style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 86, 47,92)),
                      ),
                    ),
                  ),
                    Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(220, 251, 225,242)),
                      child: const Text(
                        'Fertil',
                        style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 86, 47,92)),
                      ),
                    ),
                  ),
                       Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:const Color.fromARGB(220, 251, 225,242)),
                      child: const Text(
                        'Infertil',
                        style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 86, 47,92)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
                height: 100,
              ),
Column(
  children: [
    Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 230.0,
          height: 230.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(220, 251, 225,242),
          ),
        ),
        Text(
          '${now.day} $mesActual',
          style: const TextStyle(fontSize: 34, color: Color.fromARGB(255, 86, 47,92)),
        ),
        
      ],
    ),
  ],
),
            
  // 

 const SizedBox(height: 60),
        
          TableCalendar(
            
            firstDay: DateTime.utc(2010, 10, 20),
            lastDay: DateTime.utc(2040, 10, 20),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),            
            calendarFormat: _calendarFormat,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            rangeStartDay: DateTime(2024, 02, 5),
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            onRangeSelected: _onRangeSelectd,
            rangeEndDay: DateTime(2024, 02, 20),
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false, 
            ),
            onFormatChanged: (format) {
              if(_calendarFormat != format){
                 setState(() {
                   _calendarFormat;
                 }); 
              }
            },
            onPageChanged: ((focusedDay) {
              _focusedDay = focusedDay;
            }
            ),
            
          
          ),
        ],
      ),
    );
  }
  String obtenerMesActual(int numeroMes) {
    switch (numeroMes) {
      case 1:
        return 'Enero';
      case 2:
        return 'Febr';
      case 3:
        return 'Marzo';
      case 4:
        return 'Abril';
      case 5:
        return 'Mayo';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Agos';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dic';
      default:
        return '';
    }
  }
}


