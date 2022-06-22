import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectreportsiamu/%E0%B8%B5utils/global_variable.dart';
import 'package:projectreportsiamu/screens/home_screen.dart';
import 'package:projectreportsiamu/screens/profile_screen.dart';
import 'package:projectreportsiamu/screens/report_list_admin_screen.dart';
import 'package:projectreportsiamu/screens/report_list_screen.dart';
import 'package:projectreportsiamu/screens/service_screen.dart';
import 'package:projectreportsiamu/screens/setting_screen.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int currentTab = 2;
  final List<Widget> screens = [
    const ProfileScreen(),
    const ServiceScreen(),
    const HomeScreen(),
    const ReportListScreen(),
    const SettingScreen()
  ];
  final user = FirebaseAuth.instance.currentUser!;
  var Role = '';
  // Firebase
  Future<void> getRole() async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('UID', isEqualTo: user.uid)
        .get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      Role = data['Role'];
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
    getRole();
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [SiamColors.red, SiamColors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: Icon(Icons.home)),
        onPressed: () {
          if (currentTab == 2) {
          } else {
            Navigator.of(context).pushNamed("/homebar");
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const ProfileScreen();
                    currentTab = 0;
                  });
                },
                child: Center(
                  child: Icon(
                    currentTab == 0
                        ? Icons.person
                        : Icons.person_outline_outlined,
                    color: currentTab == 0 ? SiamColors.red : SiamColors.grey,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const ServiceScreen();
                    currentTab = 1;
                  });
                },
                child: Center(
                  child: Icon(
                    currentTab == 1 ? Icons.widgets : Icons.widgets_outlined,
                    color: currentTab == 1 ? SiamColors.red : SiamColors.grey,
                  ),
                ),
              ),
              MaterialButton(
                splashColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  setState(() {});
                },
                child: Center(
                  child: Icon(
                    Icons.home,
                    color: Colors.transparent,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  if (Role == 'admin') {
                    setState(() {
                      currentScreen = const ReportListAdminScreen();
                      currentTab = 3;
                    });
                  } else {
                    setState(() {
                      currentScreen = const ReportListScreen();
                      currentTab = 3;
                    });
                  }
                },
                child: Center(
                  child: Icon(
                    Icons.list_alt,
                    color: currentTab == 3 ? SiamColors.red : SiamColors.grey,
                  ),
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const SettingScreen();
                    currentTab = 4;
                  });
                },
                child: Center(
                  child: Icon(
                    currentTab == 4 ? Icons.settings : Icons.settings_outlined,
                    color: currentTab == 4 ? SiamColors.red : SiamColors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
