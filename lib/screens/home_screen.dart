import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];
  int activePage = 1;

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4 - 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                      itemCount: images.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemBuilder: (context, pagePosition) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Image.network(
                            images[pagePosition],
                            fit: BoxFit.cover),
                        );
                      }),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators(images.length, activePage)),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "หน่วยงานบริการ",
                    style: TextStyle(
                      fontFamily: "Roboto",
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
                        Container(
                          height: 80,
                          width: 80,
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
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
