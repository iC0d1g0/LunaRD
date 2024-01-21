import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Carga extends StatefulWidget {
  const Carga({super.key});

  @override
  State<Carga> createState() => _CargaState();
}

class _CargaState extends State<Carga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE6E2),
      body: Center(
        // child: Padding(
        //   padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            CircularPercentIndicator(
                  animation: true, 
                  animationDuration: 1000,
                  radius: 120.0,
                  lineWidth: 25,
                  percent: 1.0,
                  center: const Text('100%',style: TextStyle(fontSize: 40),),
                  progressColor: Colors.deepPurple,
                  backgroundColor: Colors.deepPurple.shade100,
                  circularStrokeCap: CircularStrokeCap.round,
                )
            ],
          ),
      //     ), 
      // ),
    ),
    );
  }
}