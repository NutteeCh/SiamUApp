import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projectreportsiamu/screens/admin_dashboard_screen.dart';
import 'package:projectreportsiamu/screens/check_state.dart';
import 'package:projectreportsiamu/screens/edit_profile_screen.dart';
import 'package:projectreportsiamu/screens/home_bottombar.dart';
import 'package:projectreportsiamu/screens/home_screen.dart';
import 'package:projectreportsiamu/screens/login_screen.dart';
import 'package:projectreportsiamu/screens/profile_screen.dart';
import 'package:projectreportsiamu/screens/register_screen.dart';
import 'package:projectreportsiamu/screens/report_detail_screen.dart';
import 'package:projectreportsiamu/screens/report_detail_admin_screen.dart';
import 'package:projectreportsiamu/screens/report_form_screen.dart';
import 'package:projectreportsiamu/screens/report_list_admin_screen.dart';
import 'package:projectreportsiamu/screens/report_list_screen.dart';
import 'package:projectreportsiamu/screens/service_screen.dart';
import 'package:projectreportsiamu/screens/setting_screen.dart';
import 'package:projectreportsiamu/screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siam U',
      theme: ThemeData(fontFamily: "Prompt"),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/homebar": (context) => const HomeBottomBar(),
        "/home": (context) => const HomeScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/editprofile": (context) => const EditProfileScreen(),
        "/service": (context) => const ServiceScreen(),
        "/report": (context) => const ReportFormScreen(),
        "/reportlist": (context) => const ReportListScreen(),
        "/reportdetail": (context) => const ReportDetailScreen(),
        "/reportdetailadmin": (context) => const ReportDetailAdminScreen(),
        "/setting": (context) => const SettingScreen(),
        "/reportlistadmin": (context) => const ReportListAdminScreen(),
        "/check": (context) => CheckState(),
        "/dashboard": (context) => const AdminDashboardScreen(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
