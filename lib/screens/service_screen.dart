import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ีutils/global_variable.dart';
import 'package:projectreportsiamu/services/url_launch.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {

  final URLLaunch ulaunch = new URLLaunch();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("หน่วยงานบริการ"),
        backgroundColor: SiamColors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "ร้องเรียนปัญหา",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/report");
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            height: 80,
                            width: 80,
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
                                color: SiamColors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Icon(
                              Icons.warning,
                              color: Colors.white,
                              size: 50,
                            )),
                          ),
                        ),
                        Text("ร้องเรียนปัญหา",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/");
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            height: 80,
                            width: 80,
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
                                color: SiamColors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Icon(
                              Icons.list_alt,
                              color: Colors.white,
                              size: 50,
                            )),
                          ),
                        ),
                        Text("รายการที่ร้องเรียน",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Container(
                      height: 80,
                      width: 80,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                    ),
                  ]),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "ช่องทางการติดต่อ",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/");
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            height: 80,
                            width: 80,
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
                                color: SiamColors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Icon(
                              Icons.person_pin_sharp,
                              color: Colors.white,
                              size: 50,
                            )),
                          ),
                        ),
                        Text("ติดต่อเจ้าหน้าที่",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ulaunch.launchURLWeb();
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            height: 80,
                            width: 80,
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
                            child: Center(
                                child: Icon(
                              Icons.help,
                              color: Colors.red,
                              size: 60,
                            )),
                          ),
                        ),
                        Text("www.Siam.edu",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ulaunch.launchURLFacebook();
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.0),
                            height: 80,
                            width: 80,
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
                            child: Center(
                                child: Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 60,
                            )),
                          ),
                        ),
                        Text("Siam University",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Colors.black,
                        ),
                        ),
                      ],
                    ),
                    Container(
                      height: 80,
                      width: 80,
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
