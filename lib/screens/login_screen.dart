import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final emailLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void getUserUID() async {
    final User? user = auth.currentUser;

    setState(() {
      userUID = user!.uid;
    });
  }

  // void getUserInfo() async {
  //   // QuerySnapshot doc = await FirebaseFirestore.instance
  //   //     .collection('users')
  //   //     .where('UID', isEqualTo: userUID)
  //   //     .get();
  //   // Map<String, dynamic> data = doc.data();
  //   Stream<QuerySnapshot> snapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('UID', isEqualTo: userUID)
  //       .snapshots();
  //   userName = snapshot.data?.docs[0]['Name'];
  //   print(doc);
  // }

  Future _signInWithEmailAndPassword() async {
    try {
      final user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailLoginController.text,
        password: passwordLoginController.text,
      ))
          .user;

      if (user != null) {
        setState(() {
          getUserUID();
          // getUserInfo();
          Navigator.of(context).pushNamed("/homebar");
        });
      } else {
        setState(() {
          Navigator.of(context).pushNamed("/");
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

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
              height: 220,
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "อีเมลล์มหาวิทยาลัย",
                style: TextStyle(
                  color: SiamColors.red,
                ),
              ),
            ),
            Form(
              key: _formKeyEmail,
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกอีเมล.";
                    } else if (!value.contains("@siam.edu")) {
                      return "* กรุณาใส่ email@siam.edu";
                    }
                    return null;
                  },
                  controller: emailLoginController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: "email@siam.edu"),
                ),
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
                  color: SiamColors.red,
                ),
              ),
            ),
            Form(
              key: _formKeyPassword,
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณาใส่รหัสผ่าน.";
                    }
                    return null;
                  },
                  controller: passwordLoginController,
                  decoration: InputDecoration(icon: Icon(Icons.key)),
                  obscureText: true,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (_formKeyEmail.currentState!.validate() &&
                    _formKeyPassword.currentState!.validate()) {
                  _signInWithEmailAndPassword();
                }
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [SiamColors.orange, SiamColors.red]),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Center(
                    child: Text(
                  "เข้าสู่ระบบ",
                  style: TextStyle(
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
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "ยังไม่มีบัญชีผู้ใช้ ?",
              style: TextStyle(
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
