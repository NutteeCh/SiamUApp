import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class ReportListAdminScreen extends StatefulWidget {
  const ReportListAdminScreen({Key? key}) : super(key: key);

  @override
  State<ReportListAdminScreen> createState() => _ReportListAdminScreen();
}

class _ReportListAdminScreen extends State<ReportListAdminScreen> {
  String? reportTypeText;
  String? statusText;

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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 180,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'ประเภท',
                        style: TextStyle(
                          fontSize: 14,
                          color: SiamColors.grey,
                        ),
                      ),
                      value: reportTypeText,
                      isExpanded: true,
                      items: typeList.map(buildMenuItem).toList(),
                      onChanged: (reportTypeText) => setState(() =>
                          this.reportTypeText = reportTypeText as String?),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 180,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'สถานะ',
                        style: TextStyle(
                          fontSize: 14,
                          color: SiamColors.grey,
                        ),
                      ),
                      value: statusText,
                      isExpanded: true,
                      items: statusReport2.map(buildMenuItem2).toList(),
                      onChanged: (statusText) => setState(
                          () => this.statusText = statusText as String?),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              //height: MediaQuery.of(context).size.height - 200,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('report_form')
                      .where('Type', isEqualTo: reportTypeText)
                      .where('Status', isEqualTo: statusText)
                      .orderBy('Date_Time', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                          child: Text("ข้อมูลผิดพลาด กรุณารีเฟรชใหม่"));
                    }
                    if (snapshot.hasData && snapshot.data!.docs.length == 0) {
                      return const Center(child: Text("ไม่พบข้อมูล"));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Color statusColor = Colors.black;
                          switch (snapshot.data?.docs[index]['Status']) {
                            case "กำลังดำเนินการ":
                              statusColor = SiamColors.yellow;
                              break;
                            case "ดำเนินการเสร็จสิ้น":
                              statusColor = SiamColors.green;
                              break;
                            case "ยกเลิกแล้ว":
                              statusColor = SiamColors.red;
                              break;
                            default:
                              statusColor = Colors.black;
                          }

                          // if (snapshot.data?.docs[index]['Status'] ==
                          //     "กำลังดำเนินการ") {
                          //   statusColor = "yellow";
                          // }
                          return Container(
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "หัวข้อเรื่อง",
                                    style: TextStyle(
                                        fontSize: 12, color: SiamColors.grey),
                                  ),
                                  Text("ประเภท",
                                      style: TextStyle(
                                          fontSize: 12, color: SiamColors.grey))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${snapshot.data?.docs[index]['Topic']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
                                  Text("${snapshot.data?.docs[index]['Type']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ผู้ร้องเรียน",
                                    style: TextStyle(
                                        fontSize: 12, color: SiamColors.grey),
                                  ),
                                  Text("เบอร์โทรติดต่อกลับ",
                                      style: TextStyle(
                                          fontSize: 12, color: SiamColors.grey))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "${snapshot.data?.docs[index]['Name']}  ${snapshot.data?.docs[index]['Surname']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      )),
                                  Text("${snapshot.data?.docs[index]['Tel']}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "สถานะ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: SiamColors.grey,
                                            fontFamily: "Prompt"),
                                      ),
                                      Text(
                                          "${snapshot.data?.docs[index]['Status']}",
                                          style: TextStyle(
                                            color: statusColor,
                                            fontSize: 14,
                                          ))
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        "/reportdetailadmin",
                                        arguments: {
                                          "docID": snapshot.data?.docs[index].id
                                        },
                                      );
                                      // Navigator.of(context)
                                      //     .pushNamed("/reportdetail");
                                    },
                                    child: Container(
                                        width: 105,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: SiamColors.red,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 22, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "ดู/แก้ไข",
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
                                        )),
                                  )
                                ],
                              )
                            ]),
                          );
                        },
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String typeList) => DropdownMenuItem(
        value: typeList,
        child: Text(
          typeList,
          style: TextStyle(fontSize: 14),
        ),
      );

  DropdownMenuItem<String> buildMenuItem2(String statusReport) =>
      DropdownMenuItem(
        value: statusReport,
        child: Text(
          statusReport,
          style: TextStyle(fontSize: 14),
        ),
      );
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
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/reportdetail");
              },
              child: Container(
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
                  )),
            )
          ],
        )
      ]),
    );
