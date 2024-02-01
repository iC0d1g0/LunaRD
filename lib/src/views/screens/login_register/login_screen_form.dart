import 'package:flutter/material.dart';

//Screens
import 'login_screen.dart';
import 'register_screen.dart';

//Widgets
import 'package:luna_rd/src/views/widgets/mybutton.dart';
import 'package:luna_rd/src/views/widgets/mybuttondos.dart';

class LoginScreenForm extends StatefulWidget {
  const LoginScreenForm({super.key});

  static const String routeName = "/login";

  @override
  State<LoginScreenForm> createState() => _LoginScreenFormState();
}

class _LoginScreenFormState extends State<LoginScreenForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 230, 244, 1),
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
                    customColor: const Color.fromRGBO(255, 206, 234, 1),
                    text: 'Iniciar Sesión',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  MyButtono(
                    customColor: const Color.fromRGBO(100, 16, 70, 1),
                    text: "Crear Cuenta",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
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
                      Text(
                        "Condiciones de uso",
                        style: TextStyle(color: Color.fromRGBO(100, 16, 70, 1)),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Politica Privacidad",
                        style: TextStyle(color: Color.fromRGBO(100, 16, 70, 1)),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
