import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:luna_rd/src/controllers/main_controller.dart';
import 'package:luna_rd/src/views/widgets/chat_context.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat con Eva',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const CharScreen(),
    );
  }
}

class CharScreen extends StatefulWidget {
  const CharScreen({super.key});

  @override
  State<CharScreen> createState() => _CharScreen();
}

class _CharScreen extends State<CharScreen> {
  final mensajeController = TextEditingController();
  bool inputDeshabilitado = false;

  List<Widget> listaWidgetChat = [];
  List<String> listaChat = [];

  List<Widget> convertirListaChatAWidget(List<String> listaChat) {
    List<Widget> listaWidgetChat = [];
    for (var i = 0; i < listaChat.length; i++) {
      if (listaChat[i].contains('ia/')) {
        listaWidgetChat.add(ChatAI(mensaje: listaChat[i].substring(3)));
      } else {
        listaWidgetChat.add(ChatPerson(mensaje: listaChat[i]));
      }
    }
    return listaWidgetChat;
  }

  void agregarMensaje(String mensaje) {
    listaChat.add(mensaje);
    listaWidgetChat = convertirListaChatAWidget(listaChat);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    agregarMensaje(MainController.respuestaChatInicial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(100, 16, 70, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(255, 230, 244, 1),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Chat con Eva',
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(100, 16, 70, 1),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ]),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
        children: listaWidgetChat,
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(100, 16, 70, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Expanded(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child:
                    Icon(Icons.face_2, color: Color.fromRGBO(255, 230, 244, 1)),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  alignment: Alignment.centerRight,
                  width: 300,
                  
                  child:  TextFormField(
                    
                      readOnly: inputDeshabilitado,
                      maxLines: null,
                      controller: mensajeController,
                      decoration: InputDecoration(
                      
                      filled: true,
                      fillColor:  const Color.fromRGBO(255, 230, 244, 1),
                      hintText: 'Escribiendo...',
                      hintStyle:  const TextStyle(
                      color:   Color.fromRGBO(100, 16, 70, 1),),
                       border: OutlineInputBorder(
                       borderRadius:  BorderRadius.circular(15),
                      ),
                      
                    ),
                  
                  ),
                ),
              ),
              InkWell(
                // ignore: avoid_print
               onTap: () async{
                if(mensajeController.text.isNotEmpty){
                  inputDeshabilitado = true;
                  setState(() {});
                  final String str = mensajeController.text;
                  mensajeController.clear();
                  agregarMensaje(str);
                  agregarMensaje(await MainController.respuestaChatGPT(str));
                  inputDeshabilitado = false;
                  setState(() {});
                }
              },
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(Icons.send_rounded,
                      color: Color.fromRGBO(255, 230, 244, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
