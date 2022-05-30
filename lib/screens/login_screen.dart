import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "อีเมลล์มหาวิทยาลัย",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: SiamColors.red,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: "email@siam.edu"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "รหัสผ่าน",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: SiamColors.red,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
              child: TextFormField(
                decoration: InputDecoration(icon: Icon(Icons.key)),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("/home");
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: SiamColors.red,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                    child: Text(
                  "เข้าสู่ระบบ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "หรือ",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ยังไม่มีบัญชีผู้ใช้ ?",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ลงทะเบียนเป็นส่วนหนึ่งกับเราที่",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("/register");
                  },
                  child: Text(
                    "มหาวิทยาลัยสยาม",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 12,
                      color: SiamColors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
