import 'package:flutter/material.dart';
import 'package:projectreportsiamu/screens/home_bottombar.dart';
import 'package:projectreportsiamu/screens/home_screen.dart';
import 'package:projectreportsiamu/screens/login_screen.dart';
import 'package:projectreportsiamu/screens/profile_screen.dart';
import 'package:projectreportsiamu/screens/register_screen.dart';
import 'package:projectreportsiamu/screens/report_form_screen.dart';
import 'package:projectreportsiamu/screens/report_list_screen.dart';
import 'package:projectreportsiamu/screens/service_screen.dart';
import 'package:projectreportsiamu/screens/setting_screen.dart';
import 'package:projectreportsiamu/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siam U',
      theme: ThemeData(fontFamily: "Roboto"),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/homebar": (context) => const HomeBottomBar(),
        "/home": (context) => const HomeScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/service": (context) => const ServiceScreen(),
        "/report":(context) => const ReportFormScreen(),
        "/reportlist": (context) => const ReportListScreen(),
        "/setting": (context) => const SettingScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
