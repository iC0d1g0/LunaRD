
import 'package:flutter/material.dart';
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

int simpleIntInput = 0;
int simpleIntInput2 = 0;
int simpleIntInput3 = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
        backgroundColor: const Color(0xFFFAE6E2),
          body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    progressColor: Colors.deepPurple,
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  ),
                  
              const Text("¿Cuando inicio tu ultimo periodo menstrual?",
               textAlign: TextAlign.center,
               style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
              ),
              const SizedBox(height: 10),
                QuantityInput(
                  // ignore: prefer_const_constructors    
                  value: simpleIntInput,
                  onChanged: (value) => setState(() => simpleIntInput = int.parse(value.replaceAll(',', 'dias')))
                ),
                const SizedBox(height: 40),
                   const Text("¿Cuando finalizo tu ultimo periodo menstrual?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                   ),
                   const SizedBox(height: 10),
                QuantityInput(
                  // ignore: prefer_const_constructors    
                  value: simpleIntInput2,
                  onChanged: (value) => setState(() => simpleIntInput2 = int.parse(value.replaceAll(',', 'dias')))
                ),
                const SizedBox(height: 40),  
                  const Text("¿cuantos dias suele durar sualmente?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  ),
                  const SizedBox(height: 10),
                QuantityInput(
                  // ignore: prefer_const_constructors    
                  value: simpleIntInput3,
                  onChanged: (value) => setState(() => simpleIntInput3 = int.parse(value.replaceAll(',', 'dias')))
                ),
                const SizedBox(height: 70),  
                MyNext(
                   customColor: const Color(0xFFDA2B9E).withOpacity(0.7),
                     text:"Siguiente",
                     onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) => const MyAhh(), 
                      ));
                     }, icon: null,
                  ),
              ]
              ),
            ),
          ), 
           appBar: AppBar(
  backgroundColor: const Color(0xFFFAE6E2),       
        leading: IconButton(
 
          icon: const Icon(Icons.arrow_back),
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