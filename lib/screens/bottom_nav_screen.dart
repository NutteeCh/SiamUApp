import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projectreportsiamu/%E0%B8%B5utils/global_variable.dart';
import 'package:projectreportsiamu/screens/profile_screen.dart';
import 'package:projectreportsiamu/screens/report_list_screen.dart';
import 'package:projectreportsiamu/screens/service_screen.dart';
import 'package:projectreportsiamu/screens/setting_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 3;
  final screens = [
    const ProfileScreen(),
    const ServiceScreen(),
    const ReportListScreen(),
    const SettingScreen(),
  ];

  void onIndexTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onIndexTapped,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: SiamColors.grey,
        selectedItemColor: SiamColors.red,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.widgets_outlined), label: "Service"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Setting"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
