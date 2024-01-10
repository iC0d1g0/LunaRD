import 'package:flutter/material.dart';
import 'package:luna_rd/components/mybutton.dart';
import 'package:luna_rd/components/mybuttondos.dart';
import 'package:luna_rd/src/login_sreen.dart';
import 'package:luna_rd/src/register.dart';
class MyloginForm extends StatefulWidget {
  const MyloginForm({super.key});

  @override
  State<MyloginForm> createState() => _MyloginFormState();
}

class _MyloginFormState extends State<MyloginForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(0xFFFAE6E2),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "assets/images/lun.png",
                      // color: Color.fromARGB(255, 10, 185, 121),
                    ),
                  ), 
                  MyButton(
                    customColor: const Color(0x00ffcec5).withOpacity(0.7), 
                    text: 'Sing In',
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) => const loginscreen(), 
                      ));
                    },
                  ),
                  const SizedBox(height: 20),
                  MyButtono(
                   customColor: const Color(0xFFDA2B9E).withOpacity(0.7),
                     text:"Create an account",
                     onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(
                      builder: (context) => const MyRegister(), 
                      ));
                     },
                  ),
                ],
              ),
              const Spacer(),            
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Condiciones de uso",
                    style: TextStyle(color: Colors.black),  
                    ),
                    SizedBox(width: 20),
                    Text("Politica Privacidad",
                    style: TextStyle(color: Colors.black),  
                    ),
                  ],
                  )
                ),
              
              ],
          ),
        ),
      ),
    );
  }
}