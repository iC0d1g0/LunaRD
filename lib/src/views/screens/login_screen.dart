import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/banco_screen.dart';
import 'package:luna_rd/src/views/widgets/mybuttondos.dart';

//Screens
import 'register_screen.dart';

//Widgets
import '../widgets/mytext.dart';


// ignore: camel_case_types
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// ignore: camel_case_types
class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  bool checkTheBox = false;
  check() {
    setState(() {
      checkTheBox = !checkTheBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE6E2),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Image.asset(
                "assets/images/lun.png",
                width: 300,
              ),
              const SizedBox(height: 10),
              const MyText(
                hintText: "correo o usuario",
              ),
              const SizedBox(height: 20),
              MyText(
                hintText: "password",
                onPressed: showPassword,
                obsecureText: showPass ? false : true,
                icon: showPass ? Icons.visibility_off : Icons.visibility,
              ),
              const SizedBox(height: 12),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.red),
                          child: Checkbox(
                            checkColor: Colors.white,
                            value: checkTheBox ? true : false,
                            onChanged: (value) {
                              check();
                            },
                          ),
                        ),
                        const Text(
                          "Remenber me",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    const Text(
                      "Olvide mi password",
                      style: TextStyle(
                        color: Color(0xFFDA2B9E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyButtono(
                  customColor: const Color(0xFFDA2B9E),
                  text: "Sign In",
                  onTap: () {
                     Navigator.push(context, 
                    MaterialPageRoute(
                    builder: (context) => const BonoPage(), 
                    ));
                  }),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Iniciar session con",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset("assets/images/goo.png", width: 40),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset("assets/images/facebook.png", width: 40),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "¿aun no tienes cuenta?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ));
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Color(0xFFDA2B9E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
