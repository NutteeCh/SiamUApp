import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectreportsiamu/%E0%B8%B5utils/global_variable.dart';

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  String? reportTypeText;
  final topicController = TextEditingController();
  final contentController = TextEditingController();
  final telController = TextEditingController();

  // Firebase
  CollectionReference reportform =
      FirebaseFirestore.instance.collection("report_form");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("ร้องเรียนปัญหา",
      //     style: TextStyle(
      //       fontFamily: 'Roboto',
      //       fontWeight: FontWeight.bold,
      //       //fontSize: 18
      //     ),
      //   ),
      //   backgroundColor: SiamColors.red,
      // ),
      body: Stack(children: [
        Container(
          alignment: Alignment.topCenter,
          height: 80 + 40,
          decoration: BoxDecoration(
              //color: SiamColors.red
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [SiamColors.red, SiamColors.orange])),
          child: Container(
            margin: EdgeInsets.only(top: 44.0, left: 15.0),
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                'ร้องเรียนปัญหา',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "กรอกข้อมูลรายละเอียด",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: topicController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "หัวข้อเรื่อง",
                        hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: SiamColors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text(
                        'ประเภทของปัญหา',
                        style: TextStyle(
                          fontFamily: "Roboto",
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
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 250,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: contentController,
                    maxLines: 12,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, top: 20.0),
                        hintText: "เนื้อหาที่ต้องการร้องเรียน...",
                        hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: SiamColors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    controller: telController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "เบอร์โทรติดต่อกลับ",
                        hintStyle: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 14,
                          color: SiamColors.grey,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20, top: 15, bottom: 15),
                  child: Text(
                    "แนบรูปภาพเพิ่มเติม",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("/");
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 20,
                                    color: SiamColors.red,
                                  ),
                                  Text(
                                    "ถ่ายรูปภาพ",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: const Text(
                          'หรือ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              color: SiamColors.grey),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("/");
                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_photo_alternate,
                                    size: 20,
                                    color: SiamColors.red,
                                  ),
                                  Text(
                                    "เลือกจากแกลลอรี่",
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        SiamColors.red,
                                        SiamColors.orange
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.close,
                                    size: 25,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "ยกเลิก",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: const Text(
                          'หรือ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w100,
                              fontSize: 14,
                              color: SiamColors.grey),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () async {
                              await reportform.add({
                                "topic": topicController.text,
                                "type": reportTypeText,
                                "content": contentController.text,
                                "tel": telController.text
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: SiamColors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "ส่งเรื่องร้องเรียน",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String typeList) => DropdownMenuItem(
        value: typeList,
        child: Text(
          typeList,
          style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
        ),
      );
}
