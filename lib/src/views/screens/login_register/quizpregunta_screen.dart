import 'package:flutter/material.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/screens/login_register/banco3_screen.dart';
import 'package:luna_rd/src/views/widgets/botontrue.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class MyAhh extends StatefulWidget {
  const MyAhh({super.key});

  @override
  State<MyAhh> createState() => _MyBanco2State();
}

class _MyBanco2State extends State<MyAhh> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
                    animationDuration: 1000,
                    lineHeight: 10,
                    percent: 0.6,
                    progressColor: const Color.fromRGBO(100, 16, 70, 1),
                    barRadius: const Radius.circular(10),
                    // ignore: deprecated_member_use
                    linearStrokeCap: LinearStrokeCap.roundAll,
                  ),
                  ),
                  
              const Text("¿Tu periodo dura mas de un mes en llegar?",
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
                text: "Más de 30 días", 
                onTap: () {
                  MainController.usuaria.duracionUsual = 1;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const  MyBono3()  , 
                      ));
                }      
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
                const Color.fromRGBO(100, 16, 70, 1),
                text: "Menos de 24 días", 
                onTap: () {
                  MainController.usuaria.duracionUsual = -1;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const  MyBono3()  , 
                      ));
                }   
               
               ),
              const SizedBox(height: 20),
                MyButtonTrue(
                customColor:
                const Color.fromRGBO(100, 16, 70, 1),
                text: "Entre 24 y 30 días", 
                onTap: () {
                  MainController.usuaria.duracionUsual = 0;
                   Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) =>const MyBono3() , 
                      ));
                }   
               
               ),
                


              ]
              ),
            ),
          ), 
           appBar: AppBar(
     backgroundColor: const Color.fromRGBO(255, 255, 255, 1),      
        leading: IconButton(
 
          icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(100, 16, 70, 1),),
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
