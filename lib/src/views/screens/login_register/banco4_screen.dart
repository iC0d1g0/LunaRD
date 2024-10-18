import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/screens/login_register/carga_screen.dart';
import 'package:luna_rd/src/views/widgets/botontrue.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MyBono4 extends StatefulWidget {
  const MyBono4({super.key});

  @override
  State<MyBono4> createState() => _MyBanco2State();
}

class _MyBanco2State extends State<MyBono4> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom:200),
            
            child: Column(  
              mainAxisSize: MainAxisSize.min,
            
              children: [   
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    child: LinearPercentIndicator(    
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true, 
                    animationDuration: 400,
                    lineHeight: 10,
                    percent: 0.9,
                    progressColor: const Color.fromRGBO(100, 16, 70, 1),
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  ),
                  
              const Text("Qué tanto líquido tomas?",
               textAlign: TextAlign.center,
               style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:  Color.fromRGBO(100, 16, 70, 1),
                    
                  ),
              ),
              const SizedBox(height: 40),
               MyButtonTrue(
                customColor:
                const Color.fromRGBO(100, 16, 70, 1),
                text: "Entre 2 y 4 veces", 
                onTap: () {
                  MainController.usuaria.tomasMuchoLiquido = "Entre 2 y 4 veces";
                    Navigator.push(context, 
                    MaterialPageRoute(
                    builder: (context) => const Carga(), 
                    ));
                }      
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
                const Color.fromRGBO(100, 16, 70, 1), 
                text: "Entre 5 y 7 veces", 
                onTap: () {
                  MainController.usuaria.tomasMuchoLiquido = "Entre 5 y 7 veces";
                    Navigator.push(context, 
                    MaterialPageRoute(
                    builder: (context) => const Carga(), 
                    ));
                }   
               
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
               const Color.fromRGBO(100, 16, 70, 1),
                text: "Mas de 8 veces", 
                onTap: () {  
                  MainController.usuaria.tomasMuchoLiquido = "Mas de 8 veces";
                    Navigator.push(context, 
                    MaterialPageRoute(
                    builder: (context) => const Carga(), 
                    ));
                }   
               ),
              ]
              ),
            ),
          ), 
           appBar: AppBar(
  backgroundColor: const Color.fromARGB(255, 255, 255, 255),       
        leading: IconButton(
 
          icon: const Icon(Icons.arrow_back, color:  Color.fromRGBO(100, 16, 70, 1),),
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
