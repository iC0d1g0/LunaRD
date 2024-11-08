import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/screens/login_register/banco2_screen.dart';
import 'package:luna_rd/src/views/widgets/next.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BonoPage extends StatefulWidget {
  const BonoPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BonoPageState createState() => _BonoPageState();
}

class _BonoPageState extends State<BonoPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Center(
        // ignore: sized_box_for_whitespace
          child: Container(
            color: const Color(0xFFFAE6E2),
            height: 300.0,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: selectedDate,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  selectedDate = newDate;
                });
              },
            ),
          ),
        );
      },
    );

    if (picked != selectedDate && picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CupertinoPageScaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          // navigationBar: const CupertinoNavigationBar(
          //   middle: Text('Seleccionar Fecha'),
          // ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10,
                    percent: 0.2,
                    progressColor: const Color.fromRGBO(100, 16, 70, 1),
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  const SizedBox(height: 250.0),
                  const Text(
                    'Fecha De Nacimiento',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Color.fromRGBO(100, 16, 70, 1),
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFFDA2B9E),
                        decoration: TextDecoration.none),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      
                    color: const Color.fromRGBO(100, 16, 70, 1),
                          border: Border.all(
                            
                    color: const Color.fromRGBO(100, 16, 70, 1),
                            width: 2.0, // Ancho del borde
                          ),
                          borderRadius: BorderRadius.circular(25.0), // Radio de borde
                    ),
                  
                    
              
                    child: CupertinoButton(
                      onPressed: () => _selectDate(context),
                      child: const Text(
                        'Seleccionar Fecha',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(255, 206, 234, 1),
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                  const SizedBox(height: 200),
                  MyNext(
                    customColor: const Color.fromRGBO(100, 16, 70, 1),
                    text: "Siguiente",
                    onTap: () {
                      MainController.usuaria.birthday = selectedDate;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyBanco2(),
                        )
                      );
                    },
                    icon: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void main() => runApp(
      const CupertinoApp(
        home: BonoPage(),
      ),
    );
