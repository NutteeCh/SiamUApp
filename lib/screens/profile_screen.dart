import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../ีutils/global_variable.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  bool issetState = true;
  var image = '';
  // Firebase
  Future<void> getUser() async {
    if (issetState == true) {
      var querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('UID', isEqualTo: user.uid)
          .get();
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
        setState(() {
          image = data['ImageURL'];
        });
      }
      setState(() {
        issetState = false;
      });
    }
  }
  //final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').doc(snapshotData.data?.doc[index]["UID"]).where('UID', isEqualTo: userUID).snapshots();

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height / 4 + 20,
            decoration: const BoxDecoration(
                //color: SiamColors.red
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [SiamColors.red, SiamColors.orange])),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 50),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white),
                  color: Colors.grey),
              child: CircleAvatar(
                radius: 80,
                backgroundColor: SiamColors.red,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 4 - 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('UID', isEqualTo: user.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text("ข้อมูลผิดพลาด กรุณารีเฟรชใหม่"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  //final userDoc = snapshot.data;
                  //Map<dynamic, dynamic> userDoc = snapshot.data! as Map<dynamic, dynamic>;
                  return SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 40),
                        child: Text(
                          "ชื่อ-นามสกุล",
                          style: TextStyle(
                            fontSize: 14,
                            color: SiamColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "${snapshot.data!.docs[0]['Name']}  ${snapshot.data!.docs[0]['Surname']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "รหัสนักศึกษา",
                          style: TextStyle(
                            fontSize: 14,
                            color: SiamColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "${snapshot.data?.docs[0]['Student ID']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "คณะ ",
                          style: TextStyle(
                            fontSize: 14,
                            color: SiamColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "${snapshot.data?.docs[0]['Faculty']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "อีเมลล์ ",
                          style: TextStyle(
                            fontSize: 14,
                            color: SiamColors.grey,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          "${snapshot.data?.docs[0]['email']}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                        child: InkWell(
                          // onTap: () {
                          //   Navigator.of(context).pushNamed("/editprofile");
                          // },
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/editprofile",
                              arguments: {"docID": snapshot.data?.docs[0].id},
                            );
                            // Navigator.of(context)
                            //     .pushNamed("/reportdetail");
                          },
                          child: Container(
                            height: 40,
                            width: 160,
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
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: SiamColors.red,
                                ),
                                Text(
                                  "แก้ไขข้อมูลส่วนตัว",
                                  style: TextStyle(
                                    color: SiamColors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  );

                  // return const Center(child: Text("มีบางอย่างผิดพลาด กรุณารีเฟรชใหม่"));
                }),
          ),
        ],
      ),
    );
  }
}
