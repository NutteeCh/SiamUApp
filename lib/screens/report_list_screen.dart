import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class ReportListScreen extends StatefulWidget {
  const ReportListScreen({Key? key}) : super(key: key);

  @override
  State<ReportListScreen> createState() => _ReportListScreenState();
}

class _ReportListScreenState extends State<ReportListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          "รายการ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Prompt',
              fontWeight: FontWeight.bold),
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: carditems.length,
            itemBuilder: (context, index) {
              return buildpetcard(context, item: carditems[index]);
            }),
      ),
    );
  }
}

class CardItem {
  String topic, category, name, tel, status;
  CardItem(
      {required this.topic,
      required this.category,
      required this.name,
      required this.tel,
      required this.status});
}

List<CardItem> carditems = [
  CardItem(
    topic: "อยากได้ตึกภาคใหม่",
    category: "การเรียน",
    name: "อนรรฆภูมิ ศรีอำไพ",
    tel: "0655632693",
    status: "กำลังดำเนินการ",
  ),
  CardItem(
    topic: "อยากได้ตึกภาคใหม่",
    category: "การเรียน",
    name: "อนรรฆภูมิ ศรีอำไพ",
    tel: "0655632693",
    status: "กำลังดำเนินการ",
  ),
  CardItem(
    topic: "อยากได้ตึกภาคใหม่",
    category: "การเรียน",
    name: "อนรรฆภูมิ ศรีอำไพ",
    tel: "0655632693",
    status: "กำลังดำเนินการ",
  ),
  CardItem(
    topic: "อยากได้ตึกภาคใหม่",
    category: "การเรียน",
    name: "อนรรฆภูมิ ศรีอำไพ",
    tel: "0655632693",
    status: "กำลังดำเนินการ",
  ),
];

Widget buildpetcard(context, {required CardItem item}) => Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      height: 166,
      width: 378,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "หัวข้อเรื่อง",
              style: TextStyle(fontSize: 12, color: SiamColors.grey),
            ),
            Text("ประเภท",
                style: TextStyle(fontSize: 12, color: SiamColors.grey))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.topic,
                style: TextStyle(
                  fontSize: 14,
                )),
            Text(item.category,
                style: TextStyle(
                  fontSize: 14,
                ))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ผู้ร้องเรียน",
              style: TextStyle(fontSize: 12, color: SiamColors.grey),
            ),
            Text("เบอร์โทรติดต่อกลับ",
                style: TextStyle(fontSize: 12, color: SiamColors.grey))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name,
                style: TextStyle(
                  fontSize: 14,
                )),
            Text(item.tel,
                style: TextStyle(
                  fontSize: 14,
                ))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สถานะ",
                  style: TextStyle(
                      fontSize: 12,
                      color: SiamColors.grey,
                      fontFamily: "Prompt"),
                ),
                Text(item.status,
                    style: TextStyle(
                      fontSize: 14,
                    ))
              ],
            ),
            Container(
                width: 105,
                height: 35,
                decoration: BoxDecoration(
                    color: SiamColors.red,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  margin: EdgeInsets.only(left: 45, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ดู",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      )
                    ],
                  ),
                ))
          ],
        )
      ]),
    );