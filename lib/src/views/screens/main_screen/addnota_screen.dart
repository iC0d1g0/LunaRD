import 'package:flutter/material.dart';
import 'package:luna_rd/src/views/screens/main%20screen/notas_screen.dart';

class AddNota extends StatelessWidget {
  const AddNota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgregarNotaMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
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
      body: ListView(
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
                          ));
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(250, 230, 226, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Notas',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
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
                hintText: 'Titulo',
                labelText: 'Titulo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.title)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Motivo',
                labelText: 'Motivo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.title)),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 10,
            decoration: InputDecoration(
                hintText: 'Nota...',
                labelText: 'Nota',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.title)),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: const Color.fromRGBO(250, 230, 226, 1),
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
                    color: Colors.black,
                    fontWeight: FontWeight.w800)),
          ),
          const SizedBox(height: 5),
          Text('${dt.day}/${dt.month}/${dt.year}',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w800)),
        ],
      ),
      bottomSheet: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            'Guardar',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
