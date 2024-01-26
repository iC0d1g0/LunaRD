import 'package:flutter/material.dart';
import 'package:luna_rd/src/app.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalendarioMenu',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 244, 242, 1),
      ),
      home: const CalendarioScreen(),
    );
  }
}

class CalendarioScreen extends StatefulWidget {
  const CalendarioScreen({super.key});
  @override
  State<CalendarioScreen> createState() => _CalendarioScreen();
}

class _CalendarioScreen extends State<CalendarioScreen>
    with TickerProviderStateMixin {
  final defaultPadding = 16.0;
  late TabController _tabController;
  // ignore: unused_field
  late TabController _tabController2;
  // ignore: unused_field
  final _tabs = [
    const Tab(text: 'Embarazo'),
    const Tab(text: 'Ovulacion'),
    const Tab(text: 'Menstruacion'),
    const Tab(text: 'Dia fertil'),
    const Tab(text: 'Dia infertil')
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
    _tabController.index = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                    'Calendario',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 215, 207),
                      ),
                      child: const Text(
                        'Ovulacion',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 124, 98),
                      ),
                      child: const Text(
                        'Embarazo',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(250, 230, 226, 1)),
                      child: const Text(
                        'Menstruacion',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 180, 165),
                      ),
                      child: const Text(
                        'Dia Fertil',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 255, 154, 134),
                      ),
                      child: const Text(
                        'Dia Infertil',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: SfCircularChart(
                onDataLabelRender: (DataLabelRenderArgs args) {
                  return activate();
                },
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    dataSource: chartData,
                    radius: "130",
                    innerRadius: "50%",
                    startAngle: 350,
                    endAngle: 350,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                  )
                ]),
          ),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010, 10, 20),
            lastDay: DateTime.utc(2040, 10, 20),
            headerVisible: true,
            availableGestures: AvailableGestures.all,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w800)),
            calendarStyle: const CalendarStyle(
                todayTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

final List<ChartData> chartData = [
  ChartData("Ovulacion", 28, const Color.fromARGB(255, 255, 215, 207)),
  ChartData("Menstruacion", 7, const Color.fromRGBO(250, 230, 226, 1)),
  ChartData("Dia Fertil", 35, const Color.fromARGB(255, 255, 180, 165)),
  ChartData("Dia Infertil", 12, const Color.fromARGB(255, 255, 154, 134)),
  ChartData("Embarazo", 2, const Color.fromARGB(255, 255, 124, 98))
];

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
