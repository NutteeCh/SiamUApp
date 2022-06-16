import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({Key? key}) : super(key: key);

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "หัวข้อเรื่อง",
                style: TextStyle(fontSize: 12, color: SiamColors.grey),
              ),
              Text("สถานะ",
                  style: TextStyle(fontSize: 12, color: SiamColors.grey))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("111111",
                  style: TextStyle(
                    fontSize: 14,
                  )),
              Text("22222",
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
                "ประเภท",
                style: TextStyle(fontSize: 12, color: SiamColors.grey),
              ),
              Text("วันที่ส่งคำร้อง",
                  style: TextStyle(fontSize: 12, color: SiamColors.grey))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("333333",
                  style: TextStyle(
                    fontSize: 14,
                  )),
              Text("01/01/2000",
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
                style: TextStyle(fontSize: 12, color: SiamColors.grey),
              ),
              Text("เบอร์โทรติดต่อกลับ",
                  style: TextStyle(fontSize: 12, color: SiamColors.grey))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("นายอนรรฆภูมิ ศรีอำไพ",
                  style: TextStyle(
                    fontSize: 14,
                  )),
              Text("066532693",
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
                style: TextStyle(fontSize: 12, color: SiamColors.grey),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text("ตรงนี้พอยาวๆมัน overflow",
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
                style: TextStyle(fontSize: 12, color: SiamColors.grey),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            width: 348,
            height: 261,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/report_mock.jpg",
                    ),
                    fit: BoxFit.fill)),
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            // onTap: () {
            //   Navigator.of(context).pushNamed("/reportdetail");
            // },
            child: Container(
                margin: EdgeInsets.only(left: 200),
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: SiamColors.red,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        "ลบ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
