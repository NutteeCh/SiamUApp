import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectreportsiamu/%E0%B8%B5utils/global_variable.dart';
import 'package:projectreportsiamu/screens/home_screen.dart';
import 'package:projectreportsiamu/screens/profile_screen.dart';
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

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomeScreen();

  @override
  Widget build(BuildContext context) {
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
                    Icons.person,
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
                    Icons.widgets,
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
                  setState(() {
                    currentScreen = const ReportListScreen();
                    currentTab = 3;
                  });
                },
                child: Center(
                  child: Icon(
                    Icons.list_alt_outlined,
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
                    Icons.settings,
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
