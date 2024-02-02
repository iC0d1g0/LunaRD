import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/screens/login_register/banco4_screen.dart';
import 'package:luna_rd/src/views/widgets/botontrue.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MyBono3 extends StatefulWidget {
  const MyBono3({super.key});

  @override
  State<MyBono3> createState() => _MyBanco2State();
}

class _MyBanco2State extends State<MyBono3> {



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
                    animationDuration: 500,
                    lineHeight: 10,
                    percent: 0.8,
                    progressColor: const Color.fromRGBO(100, 16, 70, 1),
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  ),
                  
              const Text("¿Eres sexualmente activa?",
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
                text: "No", 
                onTap: () {
                  MainController.usuaria.frecuenciaRelacionesMes = 0;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const MyBono4() , 
                      ));
                }      
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
               const Color.fromRGBO(100, 16, 70, 1), 
                text: "A veces", 
                onTap: () {
                  MainController.usuaria.frecuenciaRelacionesMes = 1;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const MyBono4() , 
                      ));
                }   
               
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
                const Color.fromRGBO(100, 16, 70, 1), 
                text: "Si", 
                onTap: () {
                  MainController.usuaria.frecuenciaRelacionesMes = 2;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const MyBono4() , 
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
 
          icon: const Icon(Icons.arrow_back), color: const Color.fromRGBO(100, 16, 70, 1),
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
