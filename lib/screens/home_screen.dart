import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/foundation.dart';

import '../ีutils/global_variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  List<String> images = [
    "https://firebasestorage.googleapis.com/v0/b/siamuapp-63364.appspot.com/o/ads%2F269845784_4849070791802778_7204382519931424982_n.jpg?alt=media&token=9da70648-53f9-4bd7-93fc-c18779240479",
    "https://firebasestorage.googleapis.com/v0/b/siamuapp-63364.appspot.com/o/ads%2F280754932_5275998395776680_7539697406378804306_n.jpg?alt=media&token=e24ab0fc-fa24-4227-866d-381751189663",
    "https://firebasestorage.googleapis.com/v0/b/siamuapp-63364.appspot.com/o/ads%2F285625561_5341901632519689_6223211474078992005_n.jpg?alt=media&token=c40c0697-d592-4637-846d-ec421aa26d6b"
  ];
  int activePage = 0;
  final user = FirebaseAuth.instance.currentUser!;
  bool roleVisible = false;

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? SiamColors.red : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  // Firebase
  Future<void> getRole() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('UID', isEqualTo: user.uid)
        .get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      userRole = data['Role'];
      userName = data['Name'];
      userSurname = data['Surname'];
      if (userRole == 'admin') {
        roleVisible = true;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    getRole();
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height / 4 + 20,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/homebg1.jpg"),
                  fit: BoxFit.fitHeight)),
          child: Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 30, right: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                  visible: roleVisible,
                  child: Text(
                    "$userRole",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: SiamColors.green,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "สวัสดี",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  "คุณ ${userName} ${userSurname}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(5.0, 5.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 4 - 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                // Container(
                //   child: Column(children: [
                //     Container(
                //       alignment: Alignment.topLeft,
                //       margin: EdgeInsets.only(left: 20, top: 10),
                //       child: Text(
                //         "สวัสดี",
                //         style: TextStyle(
                //           fontSize: 25,
                //           color: SiamColors.red,
                //         ),
                //       ),
                //     ),
                //     Row(
                //       children: [
                //         Container(
                //           alignment: Alignment.topLeft,
                //           margin: EdgeInsets.only(left: 20, top: 5),
                //           child: Text(
                //             "คุณ ${userName} ${userSurname}",
                //             style: TextStyle(
                //               fontSize: 18,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.only(
                //             left: 120,
                //           ),
                //           child: Text(
                //             "$userRole",
                //             style: TextStyle(
                //               fontSize: 30,
                //               color: SiamColors.green,
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ]),
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 30),
                //   height: 150,
                //   width: MediaQuery.of(context).size.width,
                //   child: PageView.builder(
                //       itemCount: images.length,
                //       pageSnapping: true,
                //       controller: _pageController,
                //       onPageChanged: (page) {
                //         setState(() {
                //           activePage = page;
                //         });
                //       },
                //       itemBuilder: (context, pagePosition) {
                //         return Container(
                //           margin: const EdgeInsets.all(8.0),
                //           child: Image.network(images[pagePosition],
                //               fit: BoxFit.cover),
                //         );
                //       }),
                // ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: indicators(images.length, activePage)),
                //สไลด์
                SizedBox(
                  height: 20,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 150,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      aspectRatio: 16 / 9,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 900),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activePage = index;
                        });
                      }),
                  items: images.map<Widget>((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          //margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators(images.length, activePage)),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "หน่วยงานบริการ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
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
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (userRole == 'admin') {
                                  Navigator.of(context)
                                      .pushNamed("/reportlistadmin");
                                } else {
                                  Navigator.of(context)
                                      .pushNamed("/reportlist");
                                }
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
                            Text(
                              "รายการที่ร้องเรียน",
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
                                // Navigator.of(context).pushNamed("/");
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
                            Text(
                              "ติดต่อเจ้าหน้าที่",
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  width: 390,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/bottombg1.jpg",
                          ),
                          fit: BoxFit.fill)),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
