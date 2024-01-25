import 'package:flutter/material.dart';

//Screens
import 'login_screen.dart';

//Widgets
import '../widgets/mybuttondos.dart';
import '../widgets/mytext.dart';

//controllers
import '../../controllers/register_controller.dart';
import '../../controllers/main_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPass = false;
  bool showConfirm = false;
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
            const MyText(hintText: "Nombre"),
            const SizedBox(height: 12),
            const MyText(hintText: "Email"),
            const SizedBox(height: 12),
            MyText(
              hintText: "Password",
              onPressed: showPassword,
              obsecureText: showPass ? false : true,
              icon: showPass ? Icons.visibility_off : Icons.visibility,
            ),
            const SizedBox(height: 12),
            MyText(
              hintText: "Confirmar Password",
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
                onTap: () {}),
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
                        await registrarConGoogle();
                      } catch (e) {
                        // ignore: use_build_context_synchronously
                        mensajeInferior(context, "Error al iniciar con Google", Colors.red);
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
                      registrarConGoogle();
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
