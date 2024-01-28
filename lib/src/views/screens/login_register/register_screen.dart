import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/login_register/banco_screen.dart';

//Screens
import 'login_screen.dart';

//Widgets
import 'package:luna_rd/src/views/widgets/mybuttondos.dart';
import 'package:luna_rd/src/views/widgets/mytext.dart';

//controllers
import 'package:luna_rd/src/controllers/register_controller.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPass = false;
  bool showConfirm = false;

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  showConfPass() {
    setState(() {
      showConfirm = !showConfirm;
    });
  }

  showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAE6E2),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            MyText(
              controller: nombreController,
              hintText: "Nombre",
              ),
            const SizedBox(height: 12),
            MyText(
              controller: correoController,
              hintText: "Email"
              ),
            const SizedBox(height: 12),
            MyText(
              controller: passwordController,
              hintText: "Contraseña",
              onPressed: showPassword,
              obsecureText: showPass ? false : true,
              icon: showPass ? Icons.visibility_off : Icons.visibility,
            ),
            const SizedBox(height: 12),
            MyText(
              controller: cPasswordController,
              hintText: "Confirmar Contraseña",
              onPressed: showConfPass,
              obsecureText: showConfirm ? false : true,
              icon: showConfirm ? Icons.visibility_off : Icons.visibility,
            ),
            const SizedBox(
              height: 20,
            ),
            MyButtono(
                customColor: const Color(0xFFDA2B9E),
                text: "Register",
                onTap: () async{
                  User? userRegisted = await RegisterController.registrarUsuario(context, nombreController.text, correoController.text, passwordController.text, cPasswordController.text);
                  if (MainController.usuaria != null && userRegisted != null) {
                    MainController.usuaria!.nombre = userRegisted.displayName;
                    MainController.usuaria!.correo = userRegisted.email;
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BonoPage(),
                      ),
                    );
                  } else {
                    // ignore: use_build_context_synchronously
                    MainController.mensajeInferior(context, "Error al registrar", Colors.red);
                  }
                }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Registrate con",
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
                  child: GestureDetector(
                    onTap: () async{
                      try {
                        await RegisterController.registrarConGoogle();
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        MainController.mensajeInferior(context, "Error al iniciar con Google", Colors.red);
                      }
                    },
                    child: Image.asset("assets/images/goo.png", width: 40),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      RegisterController.registrarConFacebook();
                    },
                    child: Image.asset("assets/images/facebook.png", width: 40),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "¿Ya tienes una cuenta?",
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
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: const Text(
                    "Sign In",
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
    );
  }
}
