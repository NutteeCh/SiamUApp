import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../ีutils/global_variable.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({Key? key}) : super(key: key);

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  final cancelController = TextEditingController();
  String? cancelText;
  bool cancelBT = true;
  String? cdate;

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
        child: Column(
          children: [
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
                      cancelBT = true;
                      break;
                    case "ดำเนินการเสร็จสิ้น":
                      statusColor = SiamColors.green;
                      cancelBT = false;
                      break;
                    case "ยกเลิกแล้ว":
                      statusColor = SiamColors.red;
                      cancelBT = false;
                      break;
                    default:
                      statusColor = Colors.black;
                      cancelBT = true;
                  }
                  Timestamp t = snapshots.data?['Date_Time'];
                  DateTime dt = t.toDate();
                  var newFormat = DateFormat('dd/MM/yyyy');
                  var date = newFormat.format(dt);
                  if(snapshots.data?['Cancel Date']!=null){
                    Timestamp ct = snapshots.data?['Cancel Date'];
                    DateTime cdt = ct.toDate();
                    var newFormat2 = DateFormat('dd/MM/yyyy');
                    cdate = newFormat.format(cdt);
                  }
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
                            top: 20.0,),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: snapshots.data?['ImageURL'] != null ?
                                    NetworkImage(snapshots.data?['ImageURL']) : 
                                    NetworkImage('https://firebasestorage.googleapis.com/v0/b/siamuapp-63364.appspot.com/o/report_images%2Fimage-not-found.png?alt=media&token=1fd145ed-17fd-4e01-9385-7ab058d26649'),

                                // image: AssetImage(
                                //   "assets/images/report_mock.jpg",
                                // ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                        visible: !cancelBT,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "เหตุผลที่ยกเลิก",
                              style: TextStyle(
                                  fontSize: 12, color: SiamColors.grey),
                            ),
                            Text("วันที่ยกเลิกคำร้อง",
                                style: TextStyle(
                                    fontSize: 12, color: SiamColors.grey))
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !cancelBT,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshots.data?['Cancel Reason'] != null ? '${snapshots.data?['Cancel Reason']}' : '-',
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            Text(cdate != null ? '$cdate' : '-',
                                style: TextStyle(
                                  fontSize: 14,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () async {
                          final isYes = await showCupertinoDialog(
                            context: context,
                            builder: createDialog,
                          );

                          switch (isYes) {
                            case true:
                            bool confirm = await showCupertinoDialog(
                              context: context,
                              builder: createCancelDialog,
                            );
                            if(confirm == true){
                              FirebaseFirestore.instance
                                .collection('report_form')
                                .doc(arguments['docID'])
                                .update({
                                'Status': "ยกเลิกแล้ว",
                                'Cancel Reason' : cancelText,
                                'Cancel Date' : DateTime.now(),
                                'Cancel Date Text' : DateTime.now().toString()
                               });
                               Navigator.of(context).pushNamed('/homebar');
                            }
                            Navigator.of(context).pop();
                              
                              break;
                            default:
                          }

                          // FirebaseFirestore.instance
                          //     .collection('report_form')
                          //     .doc(arguments['docID'])
                          //     .update({'Status': "ยกเลิกแล้ว"});
                        },
                        child: Visibility(
                          visible: cancelBT,
                          child: Container(
                              margin: EdgeInsets.only(left: 200),
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: SiamColors.red,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                margin: EdgeInsets.only(left: 10, right: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      "ยกเลิกคำร้อง",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      )
                    ]),
                  );
                }
              })
        ]),
      ),
    );
  }

  Widget createDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text("คุณต้องการยกเลิกคำร้องหรือไม่"),
        actions: [
          CupertinoDialogAction(
            child: Text('ไม่'),
            onPressed: () => Navigator.pop(context, false),
          ),
          CupertinoDialogAction(
            child: Text('ใช่'),
            onPressed: () => Navigator.pop(context, true),
          )
        ],
      );

  Widget createCancelDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text("กรุณากรอกเหตุผลที่ต้องการยกเลิก"),
        content: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            children: [
              TextField(
                onChanged: (value){
                  setState(() {
                    cancelText = value;
                  });
                },
                controller: cancelController,
              ),
            ],
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('ยกเลิก'),
            onPressed: () => Navigator.pop(context, false),
          ),
          CupertinoDialogAction(
            child: Text('ยืนยัน'),
            onPressed: () => Navigator.pop(context, true),
          )
        ],
      );
}
