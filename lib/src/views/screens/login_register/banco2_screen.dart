
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/screens/login_register/quizpregunta_screen.dart';
import 'package:luna_rd/src/views/widgets/next.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quantity_input/quantity_input.dart';

class MyBanco2 extends StatefulWidget {
  const MyBanco2({super.key});

  @override
  State<MyBanco2> createState() => _MyBanco2State();
}

class _MyBanco2State extends State<MyBanco2> {
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
  DateTime selectedDate2 = DateTime.now();

  Future<void> _selectDate2(BuildContext context) async {
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

int simpleIntInput = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 10),
            child: Column(  
              mainAxisSize: MainAxisSize.min,
              children: [   
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                   child: LinearPercentIndicator(    
                   width: MediaQuery.of(context).size.width - 50,
                    animation: true, 
                    animationDuration: 2000,
                    lineHeight: 10,
                    percent: 0.4,
                    progressColor: const Color.fromRGBO(100, 16, 70, 1),
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  ),
                const SizedBox(height: 20),
              const Text("¿Cuando inicio tu ultimo periodo menstrual?",
               textAlign: TextAlign.center,
               style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(100, 16, 70, 1),
                  ),
              ),
              const SizedBox(height: 10),
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
                const SizedBox(height: 20),
                Text(
                    '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFFDA2B9E),
                        decoration: TextDecoration.none),
                  ),
                const SizedBox(height: 40),
                   const Text("¿Cuando finalizo tu ultimo periodo menstrual?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(100, 16, 70, 1),
                  ),
                   ),
                   const SizedBox(height: 10),
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
                      onPressed: () => _selectDate2(context),
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
                const SizedBox(height: 20),
                Text(
                    '${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFFDA2B9E),
                        decoration: TextDecoration.none),
                  ),
                const SizedBox(height: 40),  
                  const Text("Cuántos dias suele durar?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(100, 16, 70, 1),
                  ),
                  ),
                  const SizedBox(height: 10),
                QuantityInput(
                  buttonColor: const Color.fromRGBO(100, 16, 70, 1),
                  
                  // ignore: prefer_const_constructors    
                  value: simpleIntInput,
                  onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', 'dias')))
                ),
                const SizedBox(height: 70),  
                MyNext(
                   customColor: const Color.fromRGBO(100, 16, 70, 1),
                     text:"Siguiente",
                     onTap: () {
                      MainController.usuaria.inicioUltimoPeriodo = selectedDate;
                      MainController.usuaria.finalizoUltimoPeriodo = selectedDate2;
                      MainController.usuaria.duracionUsual = simpleIntInput;
                      Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) => const MyAhh(), 
                      ));
                     }, icon: null,
                  ),
              ]
              ),
            ), 
           appBar: AppBar(
  backgroundColor:const Color.fromARGB(255, 255, 255, 255),       
        leading: IconButton(
 
          icon: const Icon(Icons.arrow_back, color:   Color.fromRGBO(100, 16, 70, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
      // ),
        ), 
      ),
      ),
    );
  }
}