import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pie_chart/pie_chart.dart';

import '../ีutils/global_variable.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int key1 = 0;
  int key2 = 0;
  late List<Report> _report = [];
  late List<Report> _type = [];

  Map<String, double> getStatusData() {
    Map<String, double> statusMap = {};
    for (var item in _report) {
      if (statusMap.containsKey(item.Status) == false) {
        statusMap[item.Status] = 1;
      } else {
        statusMap.update(item.Status, (int) => statusMap[item.Status]! + 1);
        // test[item.category] = test[item.category]! + 1;
      }
      // print(statusMap);
    }
    return statusMap;
  }

  Map<String, double> getTypeData() {
    Map<String, double> typeMap = {};
    for (var item in _report) {
      if (typeMap.containsKey(item.Type) == false) {
        typeMap[item.Type] = 1;
      } else {
        typeMap.update(item.Type, (int) => typeMap[item.Type]! + 1);
        // test[item.category] = test[item.category]! + 1;
      }
    }
    return typeMap;
  }

  List<Color> colorList = [
    SiamColors.red,
    SiamColors.green,
    SiamColors.yellow,
  ];

  Widget pieChartExampleOne() {
    return PieChart(
      key: ValueKey(key1),
      dataMap: getStatusData(),
      initialAngleInDegree: 0,
      animationDuration: Duration(milliseconds: 1000),
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      ringStrokeWidth: 32,
      colorList: colorList,
      chartLegendSpacing: 32,
      chartValuesOptions: const ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValuesInPercentage: true,
          showChartValueBackground: true,
          showChartValues: true,
          chartValueStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      centerText: 'สถานะ',
      legendOptions: const LegendOptions(
          showLegendsInRow: false,
          showLegends: true,
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.right,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> expStream =
        FirebaseFirestore.instance.collection('report_form').snapshots();

    void getExpfromSnapshot(snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _report = [];
        for (int i = 0; i < snapshot.docs.length; i++) {
          var a = snapshot.docs[i];
          // print(a.data());
          Report rep = Report.fromJson(a.data());
          _report.add(rep);
          // print(exp);

        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        toolbarHeight: 76,
        title: Text(
          "รายงานผลสรุป",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        //backgroundColor: SiamColors.red,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[SiamColors.red, SiamColors.orange]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "ข้อมูลคำร้องเรียนในระบบ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 30),
              //height: MediaQuery.of(context).size.height - 200,
              child: StreamBuilder<Object>(
                stream: expStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("something went wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  final data = snapshot.requireData;
                  // print("Data: $data");
                  getExpfromSnapshot(data);
                  return pieChartExampleOne();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Report {
  String UID;
  String Status;
  String Type;

  Report({
    required this.UID,
    required this.Status,
    required this.Type,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      UID: json['UID'],
      Status: json['Status'],
      Type: json['Type'],
    );
  }
}
