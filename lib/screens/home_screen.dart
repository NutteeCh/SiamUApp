import 'package:carousel_slider/carousel_slider.dart';
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
    "https://scontent.fbkk22-8.fna.fbcdn.net/v/t39.30808-6/285625561_5341901632519689_6223211474078992005_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeG3Hg0XBPQEeTIVsUqvbYU6iWX6i-xxr-aJZfqL7HGv5hataGfBDMtc18oNMbEE2G2RWC1GpVvPnO9jN73xJpl3&_nc_ohc=D0OFyBfqQVQAX_iqd6v&_nc_ht=scontent.fbkk22-8.fna&oh=00_AT8Al_bDMhVOFIYlFpS2YIy-PbTRtOeDcVtB4iuHncJ5cA&oe=62A3A423",
    "https://scontent.fbkk22-8.fna.fbcdn.net/v/t39.30808-6/280754932_5275998395776680_7539697406378804306_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeENjN4ZWdSW2jPdLHtScnm-uHRW1t-yTIe4dFbW37JMh6t-e2lC1f-SvYs6qa7p6t8xrK9fBAt8vPMvrytbvmoo&_nc_ohc=ihYcRoEp9vsAX9VM3CV&_nc_ht=scontent.fbkk22-8.fna&oh=00_AT8Sw0woa8nbOY4vl6XqgnG6g4DUnkW8UrdLc463DXitSw&oe=62A46753",
    "https://scontent.fbkk22-8.fna.fbcdn.net/v/t39.30808-6/277727514_5168644706512050_4223932917801905819_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=e3f864&_nc_eui2=AeGzf5FG_37yr45EhCh-FLLlu3_IVEwXSQq7f8hUTBdJCiQY3b8GCaXLkzUDruK6Jox5b1l0mVR0ALocZEK7LEuE&_nc_ohc=uXsTJC4lPfAAX9vnJ5n&_nc_ht=scontent.fbkk22-8.fna&oh=00_AT96M5RbUSy-Sks1lTn56uT777M8o17cZJJj_dVCVmnHpw&oe=62A41554"
  ];
  int activePage = 0;

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
                SizedBox(
                  height: 25.0,
                ),
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
                //           child: Image.network(
                //             images[pagePosition],
                //             fit: BoxFit.cover),
                //         );
                //       }),
                // ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: indicators(images.length, activePage)
                // ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    aspectRatio: 16/9,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 900),
                    onPageChanged: (index, reason){
                      setState(() {
                        activePage = index;
                      });
                    }
                  ),
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
                                    offset: Offset(0,2), // changes position of shadow
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
                    children: indicators(images.length, activePage)
                ),
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
