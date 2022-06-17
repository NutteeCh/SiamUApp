import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectreportsiamu/%E0%B8%B5utils/global_variable.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          "การตั้งค่า",
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/");
            },
            child: Container(
              height: 50,
              width: 350,
              padding: EdgeInsets.all(10),
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
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Row(
                children: [
                  Text(
                    "เกี่ยวกับเรา",
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: SiamColors.grey,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed("/login");
            },
            child: Container(
              height: 50,
              width: 350,
              padding: EdgeInsets.all(10),
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
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Row(
                children: [
                  Text(
                    "ออกจากระบบ",
                    style: TextStyle(
                      color: SiamColors.red,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: SiamColors.red,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectedTab(int index) {
    setState(() {
      int _selectedIndex = index;
    });
  }
}
