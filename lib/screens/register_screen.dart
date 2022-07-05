import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? facultyText;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final studentidController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmedController = TextEditingController();

  final _formKeyRegister = GlobalKey<FormState>();

  String? uid;

  CollectionReference users = FirebaseFirestore.instance.collection("users");

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future getUserUID() async {
    final User? user = auth.currentUser;

    setState(() {
      uid = user!.uid;
    });
  }

  Future uploadUserData() async {
    setState(() {
      uid;
    });

    await users.add({
      "Name": nameController.text,
      "Surname": surnameController.text,
      "Student_ID": studentidController.text,
      "Faculty": facultyText,
      "email": emailController.text,
      "password": passwordController.text,
      "Role": "user",
      "UID": uid,
      "ImageURL": ''
    });
    setState(() {
      Navigator.of(context).pushNamed("/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKeyRegister,
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/upper2.png"),
                        fit: BoxFit.fill)),
              ),
              Text(
                "ลงทะเบียน",
                style: TextStyle(
                  fontSize: 18,
                  color: SiamColors.red,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "สร้างบัญชีผู้ใช้ ",
                style: TextStyle(
                  fontSize: 18,
                  color: SiamColors.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกชื่อ.";
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: "ชื่อ",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: SiamColors.red,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกนามสกุล.";
                    }
                    return null;
                  },
                  controller: surnameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "นามสกุล",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SiamColors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกรหัสนักศึกษา.";
                    }
                    return null;
                  },
                  controller: studentidController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "รหัสนักศึกษา",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SiamColors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: SiamColors.red)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration.collapsed(hintText: ''),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "* กรุณาเลือกคณะ.";
                      }
                      return null;
                    },
                    hint: Text(
                      'คณะ',
                      style: TextStyle(
                        fontSize: 16,
                        color: SiamColors.grey,
                      ),
                    ),
                    value: facultyText,
                    isExpanded: true,
                    items: facultyList.map(buildMenuItem).toList(),
                    onChanged: (facultyText) => setState(
                        () => this.facultyText = facultyText as String?),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกอีเมล.";
                    } else if (!value.contains("@siam.edu")) {
                      return "* กรุณาใส่ email@siam.edu";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "อีเมลมหาวิทยาลัย",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SiamColors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกรหัสผ่าน.";
                    } else if (value.length < 6) {
                      return "* กรุณากรอกรหัสผ่านมากกว่า 6 ตัวอักษร.";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "รหัสผ่าน",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SiamColors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "* กรุณากรอกรหัสผ่านอีกครั้ง.";
                    } else if (passwordController.text !=
                        passwordConfirmedController.text) {
                      return "* กรุณากรอกรหัสผ่านให้ตรงกัน.";
                    }
                    return null;
                  },
                  controller: passwordConfirmedController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: "ยืนยันรหัสผ่าน",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: SiamColors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: SiamColors.red,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("/login");
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text(
                        "ยกเลิก",
                        style: TextStyle(
                          color: SiamColors.red,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      if (_formKeyRegister.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordConfirmedController.text,
                          );
                          getUserUID();
                          uploadUserData();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 190,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: SiamColors.red,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                          child: Text(
                        "สร้างบัญชี",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String facultyList) =>
      DropdownMenuItem(
        value: facultyList,
        child: Text(
          facultyList,
          style: TextStyle(fontSize: 14),
        ),
      );
}
