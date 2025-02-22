import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
  void initState() {
    super.initState();
    if (userRole == 'admin') {
      setState(() {
        roleVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          "หน่วยงานบริการทั้งหมด",
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
                "บริการ",
                style: TextStyle(
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
                        Text(
                          "ร้องเรียนปัญหา",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Column(
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         Navigator.of(context).pushNamed("/reportlist");
                    //       },
                    //       child: Container(
                    //         margin: EdgeInsets.only(bottom: 5.0),
                    //         height: 80,
                    //         width: 80,
                    //         decoration: BoxDecoration(
                    //             boxShadow: [
                    //               BoxShadow(
                    //                 color: Colors.grey.withOpacity(0.5),
                    //                 spreadRadius: 3,
                    //                 blurRadius: 7,
                    //                 offset: Offset(
                    //                     0, 3), // changes position of shadow
                    //               ),
                    //             ],
                    //             color: SiamColors.red,
                    //             borderRadius:
                    //                 BorderRadius.all(Radius.circular(10))),
                    //         child: Center(
                    //             child: Icon(
                    //           Icons.list_alt,
                    //           color: Colors.white,
                    //           size: 50,
                    //         )),
                    //       ),
                    //     ),
                    //     Text(
                    //       "รายการที่ร้องเรียน",
                    //       style: TextStyle(
                    //         fontSize: 10,
                    //         color: Colors.black,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Visibility(
                      visible: roleVisible,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("/dashboard");
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
                                Icons.analytics,
                                color: Colors.white,
                                size: 50,
                              )),
                            ),
                          ),
                          Text(
                            "รายงานสรุปผล",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
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
                            launchUrlString("tel://028678088");
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
                              Icons.contact_phone,
                              color: Colors.white,
                              size: 50,
                            )),
                          ),
                        ),
                        Text(
                          "ติดต่อเจ้าหน้าที่",
                          style: TextStyle(
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
                                child: Image.asset(
                              'assets/images/logo.png',
                              height: 50,
                              width: 50,
                            )),
                          ),
                        ),
                        Text(
                          "เว็บไซต์ Siam.edu",
                          style: TextStyle(
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
                        Text(
                          "Siam University",
                          style: TextStyle(
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
