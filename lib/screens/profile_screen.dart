import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';
import '../ีutils/global_variable.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 4 + 20,
            decoration: BoxDecoration(color: SiamColors.red),
            child: Container(
              child: Center(
                  child: Icon(
                Icons.person_rounded,
                color: Colors.white,
                size: 100,
              )),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 250),
            child: Text(
              "ชื่อ-นามสกุล",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: SiamColors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 290),
            child: Text(
              "นายอนรรฆภูมิ ศรีอำไพ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 330),
            child: Text(
              "รหัสนักศึกษา",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: SiamColors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 370),
            child: Text(
              "6104800010",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 420),
            child: Text(
              "คณะ ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: SiamColors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 460),
            child: Text(
              "วิทยาศาสตร์ ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 510),
            child: Text(
              "อีเมลล์ ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                color: SiamColors.grey,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20, top: 550),
            child: Text(
              "anakkapoom.sri@siam.edu",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 550),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/home");
              },
              child: Container(
                height: 40,
                width: 152,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                    child: Text(
                  "แก้ไขข้อมูลส่วนตัว",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: SiamColors.red,
                    fontSize: 14,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
