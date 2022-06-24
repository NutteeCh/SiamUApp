import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../ีutils/global_variable.dart';

class ReportDetailAdminScreen extends StatefulWidget {
  const ReportDetailAdminScreen({Key? key}) : super(key: key);

  @override
  State<ReportDetailAdminScreen> createState() =>
      _ReportDetailAdminScreenState();
}

class _ReportDetailAdminScreenState extends State<ReportDetailAdminScreen> {
  String? statusText;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          "รายละเอียดคำร้อง",
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
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(children: [
            StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('report_form')
                    .doc(arguments['docID'])
                    .snapshots(),
                builder: (context, snapshots) {
                  var widget = Container();
                  if (snapshots.data == null) {
                    return widget;
                  } else {
                    Color statusColor = Colors.black;
                    switch (snapshots.data!['Status']) {
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
                    Timestamp t = snapshots.data?['Date_Time'];
                    DateTime dt = t.toDate();
                    var newFormat = DateFormat('yyyy-MM-dd');
                    var date = newFormat.format(dt);
                    return Container(
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "หัวข้อเรื่อง",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                            Text("สถานะ",
                                style: TextStyle(
                                    fontSize: 12, color: SiamColors.grey))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshots.data?['Topic'],
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            Text(snapshots.data!['Status'],
                                style: TextStyle(
                                  color: statusColor,
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
                              "ประเภท",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                            Text("วันที่ส่งคำร้อง",
                                style: TextStyle(
                                    fontSize: 12, color: SiamColors.grey))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshots.data?['Type'],
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            Text(date,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                snapshots.data?['Name'] +
                                    '  ' +
                                    snapshots.data?['Surname'],
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            Text(snapshots.data?['Tel'],
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
                            Text(
                              "เนื้อหา",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(snapshots.data?['Content'],
                                  style: TextStyle(
                                    fontSize: 14,
                                  )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "รูปภาพเพิ่มเติม",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          width: 348,
                          height: 261,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(snapshots.data?['ImageURL']),

                                  // image: AssetImage(
                                  //   "assets/images/report_mock.jpg",
                                  // ),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "แก้ไขสถานะ",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 170,
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border:
                                            Border.all(color: Colors.black)),
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
                                        items: statusReport
                                            .map(buildMenuItem)
                                            .toList(),
                                        onChanged: (statusText) => setState(
                                            () => this.statusText =
                                                statusText as String?),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      child: InkWell(
                                    onTap: () {
                                      if (statusText != null) {
                                        FirebaseFirestore.instance
                                            .collection('report_form')
                                            .doc(arguments['docID'])
                                            .update({'Status': statusText});
                                      }

                                      //Navigator.of(context).pushNamed("/reportdetail");
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(left: 30),
                                        width: 160,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: SiamColors.red,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.save,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              Text(
                                                "บันทึกการแก้ไข",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ))
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    );
                  }
                })
          ]),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String statusReport) =>
      DropdownMenuItem(
        value: statusReport,
        child: Text(
          statusReport,
          style: TextStyle(fontSize: 14),
        ),
      );
}
