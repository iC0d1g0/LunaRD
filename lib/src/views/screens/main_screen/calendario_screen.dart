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
  late TabController _tabController2;
  final _tabs = [
    const Tab(text: '2 Dias'),
    const Tab(text: '14 Dias'),
    const Tab(text: '30 Dias')
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(
                height: defaultPadding,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: const Color.fromRGBO(250, 230, 226, 1)),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: TabBar(
                  controller: _tabController2,
                  tabs: _tabs,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(fontSize: 18),
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                      color: const Color.fromRGBO(250, 230, 226, 1),
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(80)),
                ),
              ),
              SizedBox(
                height: defaultPadding * 2,
              ),
              Expanded(
                child: SfCircularChart(
                    onDataLabelRender: (DataLabelRenderArgs args) {
                      args.text = "Buen dia";
                    },
                    series: <CircularSeries>[
                      DoughnutSeries<ChartData, String>(
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
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
              SizedBox(
                height: defaultPadding * 2,
              ),
              TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2010, 10, 20),
                lastDay: DateTime.utc(2040, 10, 20),
                headerVisible: true,
                headerStyle: const HeaderStyle(
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w800)),
                calendarStyle: const CalendarStyle(
                    todayTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<ChartData> chartData = [
  ChartData("Ovulacion", 28, const Color.fromARGB(255, 255, 215, 207)),
  ChartData("Menstruacion", 7, const Color.fromRGBO(250, 230, 226, 1)),
  ChartData("Dia Fertil", 35, const Color.fromARGB(255, 255, 180, 165)),
  ChartData("Dia Infertil", 12, const Color.fromARGB(255, 255, 154, 134)),
];

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
