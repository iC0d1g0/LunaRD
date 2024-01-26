import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';

class Diagnostico extends StatelessWidget {
  const Diagnostico({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DiagnosticoMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const DiagnosticoScreen(),
    );
  }
}

class DiagnosticoScreen extends StatefulWidget {
  const DiagnosticoScreen({super.key});

  @override
  State<DiagnosticoScreen> createState() => _DiagnosticoScreen();
}

class _DiagnosticoScreen extends State<DiagnosticoScreen> {
  List nombres = ['Peso', 'Hidratacion', 'Sueño'];
  List<Color> colores = [
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
  ];
  List<Icon> iconos = [
    const Icon(Icons.accessibility_new_rounded, color: Colors.black, size: 40),
    const Icon(Icons.water_drop, color: Colors.black, size: 40),
    const Icon(Icons.cloud, color: Colors.black, size: 40),
  ];

  // ignore: non_constant_identifier_names
  List Sexnombres = ['Nada', 'Pocas', 'Normal', 'Mucho', 'Muy Activa'];
  // ignore: non_constant_identifier_names
  List<Color> Sexcolores = [
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
  ];
  // ignore: non_constant_identifier_names
  List<Icon> Sexiconos = [
    const Icon(Icons.no_adult_content_outlined, color: Colors.black, size: 30),
    const Icon(Icons.star_half_outlined, color: Colors.black, size: 30),
    const Icon(Icons.published_with_changes_rounded,
        color: Colors.black, size: 30),
    const Icon(Icons.volunteer_activism_outlined,
        color: Colors.black, size: 30),
    const Icon(Icons.volunteer_activism_rounded, color: Colors.black, size: 30),
  ];

  // ignore: non_constant_identifier_names
  List Statenombres = [
    'Normal',
    'Agresiva',
    'Sensible',
    'Emocional',
    'Gloton',
    'Alegre',
    'Cansada'
  ];
  // ignore: non_constant_identifier_names
  List<Color> Statecolores = [
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
  ];
  // ignore: non_constant_identifier_names
  List<Icon> Stateiconos = [
    const Icon(Icons.messenger_rounded, color: Colors.black, size: 30),
    const Icon(Icons.announcement_sharp, color: Colors.black, size: 30),
    const Icon(Icons.crisis_alert_sharp, color: Colors.black, size: 30),
    const Icon(Icons.not_interested_sharp, color: Colors.black, size: 30),
    const Icon(Icons.food_bank, color: Colors.black, size: 30),
    const Icon(Icons.tag_faces_rounded, color: Colors.black, size: 30),
    const Icon(Icons.airline_seat_flat_rounded, color: Colors.black, size: 30),
  ];

  // ignore: non_constant_identifier_names
  List Simnombres = ['Nada', 'Mas Busto', 'Dolores'];
  // ignore: non_constant_identifier_names
  List<Color> Simcolores = [
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1),
    const Color.fromRGBO(250, 230, 226, 1)
  ];
  // ignore: non_constant_identifier_names
  List<Icon> Simiconos = [
    const Icon(Icons.not_interested, color: Colors.black, size: 30),
    const Icon(Icons.woman, color: Colors.black, size: 30),
    const Icon(Icons.personal_injury_rounded, color: Colors.black, size: 30)
  ];

  // ignore: non_constant_identifier_names
  List Pasnombres = ['anticonceptivo'];
  // ignore: non_constant_identifier_names
  List<Color> Pascolores = [const Color.fromARGB(255, 255, 196, 184)];
  // ignore: non_constant_identifier_names
  List<Icon> Pasiconos = [
    const Icon(Icons.baby_changing_station, color: Colors.black, size: 30)
  ];

  // ignore: non_constant_identifier_names
  List Emtnombres = ['Agregar'];
  // ignore: non_constant_identifier_names
  List<Color> Emtcolores = [const Color.fromARGB(255, 255, 196, 184)];
  // ignore: non_constant_identifier_names
  List<Icon> Emticonos = [
    const Icon(Icons.plus_one, color: Colors.black, size: 30)
  ];

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
                            builder: (context) => const MyApp(),
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
                      'Diagnosticacion',
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
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(250, 230, 226, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Medicion',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Row(
                  children: [
                    Text(
                      'probabilidad de embarazo',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Icon(Icons.crib_rounded)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: .2,
                        backgroundColor: Colors.black54,
                        color: Color.fromARGB(255, 255, 196, 184),
                        minHeight: 5,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '20%',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Fecha  ${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}',
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              GridView.builder(
                itemCount: nombres.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1.1),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        // ignore: avoid_print
                        onTap: () => print(
                            'Colocar ventana emergente para rellenar este campo.'),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              color: colores[index], shape: BoxShape.circle),
                          child: Center(child: iconos[index]),
                        ),
                      ),
                      Text(
                        nombres[index],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  );
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Relaciones Sexuales',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Sexnombres.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => Sexcolores[index] =
                          const Color.fromARGB(255, 255, 196, 184),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Sexcolores[index], shape: BoxShape.circle),
                        child: Center(
                          child: Sexiconos[index],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Sexnombres[index],
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Estado de animo',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 120,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: Statenombres.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => Statecolores[index] =
                          const Color.fromARGB(255, 255, 196, 184),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Statecolores[index], shape: BoxShape.circle),
                        child: Center(
                          child: Stateiconos[index],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Statenombres[index],
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Gestion de anticonceptivos',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(250, 230, 226, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pastillas',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      // ignore: avoid_print
                      onTap: () => print('hola mundo'),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Emtcolores[0], shape: BoxShape.circle),
                        child: Center(
                          child: Emticonos[0],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(250, 230, 226, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Inyecciones',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      // ignore: avoid_print
                      onTap: () => print('hola mundo'),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Emtcolores[0], shape: BoxShape.circle),
                        child: Center(
                          child: Emticonos[0],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(250, 230, 226, 1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pastilla PosDay',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      // ignore: avoid_print
                      onTap: () => print('hola mundo'),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Emtcolores[0], shape: BoxShape.circle),
                        child: Center(
                          child: Emticonos[0],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recomendamos fuertemente que si tomaste uno de estos métodos anticonceptivos tener precaución al volver a ingerir uno de estos por 2 segunda vez consecutiva.',
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
