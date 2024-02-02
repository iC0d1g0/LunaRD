import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/main_screen/notas_screen.dart';
import 'package:luna_rd/src/views/widgets/my_cosita.dart';
//import 'package:luna_rd/src/views/widgets/mybutton.dart';

class AddNota extends StatelessWidget {
  const AddNota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgregarNotaMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      home: const AddNotaScreen(),
    );
  }
}

class AddNotaScreen extends StatefulWidget {
  const AddNotaScreen({super.key});
  @override
  State<AddNotaScreen> createState() => _AddNotaScreen();
}

class _AddNotaScreen extends State<AddNotaScreen> {
  DateTime dt = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1)   , body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Nota(),
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
                      'Agregar Nota',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color.fromRGBO(100, 16, 70, 1),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),

          TextField(
            
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 230, 244, 1),
              hintText: 'Titulo',
              hintStyle: const TextStyle(
              color: Color.fromRGBO(100, 16, 70, 1),
              ),
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: const Icon(Icons.title,color: Color.fromRGBO(100, 16, 70, 1),
                ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 230, 244, 1),
                hintText: 'Motivo',
                hintStyle: const TextStyle(
                color: Color.fromRGBO(100, 16, 70, 1)
              ),
                
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: const Icon(Icons.title,color: Color.fromRGBO(100, 16, 70, 1),)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromRGBO(255, 230, 244, 1),
                hintText: 'Nota...',
                
                hintStyle: const TextStyle(
                color: Color.fromRGBO(100, 16, 70, 1)
              ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.title,color: Color.fromRGBO(100, 16, 70, 1),)),
          ),
          const SizedBox(height: 5),
          MaterialButton(
            color: const Color.fromRGBO(100, 16, 70, 1),
            onPressed: () => showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2200),
                    initialDate: dt)
                .then((value) {
              setState(() {
                dt = value!;
              });
            }),
            child: const Text('Selecciona Fecha',
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(255, 230, 244, 1),
                    fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 5),
          Text('${dt.day}/${dt.month}/${dt.year}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(100, 16, 70, 1),
                  fontWeight: FontWeight.w800)),
        ],
      ),
      bottomSheet: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: MyCosita(
            text: 'Guardar Accion',
            colorText: const Color.fromRGBO(255, 230, 244, 1),
            customColor: const Color.fromRGBO(100, 16, 70, 1),
            onTap: () => {}, //print("Accion de guardar las notificaciones creadas."),
          )),
    );
  }
}
