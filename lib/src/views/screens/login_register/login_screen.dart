import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/widgets/mybuttondos.dart';

//Screens
import 'register_screen.dart';

//Widgets
import 'package:luna_rd/src/views/widgets/mytext.dart';

//controllers
import 'package:luna_rd/src/controllers/login_controller.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';

// ignore: camel_case_types
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// ignore: camel_case_types
class _LoginScreenState extends State<LoginScreen> {

  final nombreController = TextEditingController();
  final passwordController = TextEditingController();

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

  void navigateIfLoginSuccessful(BuildContext context, bool loginSuccessful) {
    if (loginSuccessful) {
      MainController.reiniciarApp(context);
    } else {
      MainController.mensajeInferior(context, "Usuario o contraseña incorrecta", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    MainController.barColor = const Color(0xFFFAE6E2);

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
              MyText(
                controller: nombreController,
                hintText: "Correo o Usuario",
              ),
              const SizedBox(height: 20),
              MyText(
                hintText: "Contraseña",
                controller: passwordController,
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
                          "Mantenerme conectada",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    const Text(
                      "Olvide mi contraseña",
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
                text: "Iniciar Sesión",
                onTap: () async {
                  bool loginSuccessful = await LoginController.verificarLogin(context, checkTheBox, nombreController.text, passwordController.text);
                  // ignore: use_build_context_synchronously
                  navigateIfLoginSuccessful(context, loginSuccessful);
                }
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Iniciar sessión con",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () async{
                        try {
                          await LoginController.iniciarConGoogle(context);
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          MainController.mensajeInferior(context, "Error al iniciar con Google", Colors.red);
                        }
                      },
                      child: Image.asset("assets/images/goo.png", width: 40)
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () async{
                        try {
                          await LoginController.iniciarConFacebook(context);
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          MainController.mensajeInferior(context, "Error al iniciar con Facebook", Colors.red);
                        }
                      },
                      child: Image.asset("assets/images/facebook.png", width: 40),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "¿Aún no tienes cuenta?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
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
                        fontSize: 16,
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
