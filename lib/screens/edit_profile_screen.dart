import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../ีutils/global_variable.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? facultyText;

  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final studentidController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmedController = TextEditingController();

  final _formKeyRegister = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

  File? selectedImage;
  UploadTask? uploadTask;
  bool uploadStatus = false;

  File? _imageFile;
  String? imageURL = null;

  Future pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);

    setState(() {
      _imageFile = File(pickedImage!.path);
    });
    uploadImageToFirebase();
  }

  Future<void> uploadImageToFirebase() async {
    String fileName = basename(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('profile_images/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {
      uploadStatus = true;
    });
    if (uploadStatus = true) {
      taskSnapshot.ref.getDownloadURL().then(
            (value) => imageURL = value,
          );
      setState(() {
        imageURL;
      });
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  //.where("UID",isEqualTo: userUID) as CollectionReference<Object?> ;

  final snackBar2 = const SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(
      'Error ! cannot upload image to server, please try again.',
      style: TextStyle(color: Colors.white),
    ),
    // action: SnackBarAction(
    //   label: 'Undo',
    //   textColor: Colors.white,
    //   onPressed: () {},
    // ),
    backgroundColor: SiamColors.red,
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_imageFile != null)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: Image.file(
                      File(_imageFile!.path),
                      fit: BoxFit.cover,
                    ).image,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: SiamColors.orange),
                          ),
                        ),
                      ),
                    ]),
                  ),
                if (_imageFile == null)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage("assets/images/nullprofile.png"),
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            pickImage(ImageSource.camera);
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.edit, color: SiamColors.orange),
                          ),
                        ),
                      ),
                    ]),
                  )
              ],
            ),
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4 - 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25))),
              child: SingleChildScrollView(
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
                      "ham eiei ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    // height: 40,
                    // margin: EdgeInsets.only(left: 20, right: 20, top: 20),

                    // child: TextFormField(
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "* กรุณากรอกชื่อ";
                    //     }
                    //     return null;
                    //   },
                    //   controller: nameController,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.only(left: 10),
                    //       hintText: "ชื่อ",
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       errorBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: SiamColors.red,
                    //         ),
                    //         borderRadius: BorderRadius.circular(10),
                    //       )),
                    // ),
                  ),
                  // Container(
                  //   height: 40,
                  //   margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  //   child: TextFormField(
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return "* กรุณากรอกนามสกุล";
                  //       }
                  //       return null;
                  //     },
                  //     controller: surnameController,
                  //     decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(left: 10),
                  //         hintText: "นามสกุล",
                  //         enabledBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: Colors.black,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         errorBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: Colors.black,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         border: OutlineInputBorder(
                  //             borderSide: BorderSide(
                  //               color: Colors.black,
                  //             ),
                  //             borderRadius: BorderRadius.circular(10)),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //             color: SiamColors.red,
                  //           ),
                  //           borderRadius: BorderRadius.circular(10),
                  //         )),
                  //   ),
                  // ),
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
                      "xxxxxxxxxx ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    // height: 40,
                    // margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    // child: TextFormField(
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return "* กรุณากรอกรหัสนักศึกษา";
                    //     }
                    //     return null;
                    //   },
                    //   controller: studentidController,
                    //   decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.only(left: 10),
                    //       hintText: "รหัส",
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       errorBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       border: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //             color: Colors.black,
                    //           ),
                    //           borderRadius: BorderRadius.circular(10)),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //           color: SiamColors.red,
                    //         ),
                    //         borderRadius: BorderRadius.circular(10),
                    //       )),
                    // ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "คณะ",
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
                      "คณะ ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    // height: 40,
                    // margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10.0),
                    //     border: Border.all(color: Colors.black)),
                    // child: DropdownButtonHideUnderline(
                    //   child: DropdownButtonFormField<String>(
                    //     decoration: InputDecoration.collapsed(hintText: ''),
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return "* กรุณาเลือกคณะ";
                    //       }
                    //       return null;
                    //     },
                    //     hint: Text(
                    //       'คณะ',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         color: SiamColors.grey,
                    //       ),
                    //     ),
                    //     value: facultyText,
                    //     isExpanded: true,
                    //     items: facultyList.map(buildMenuItem).toList(),
                    //     onChanged: (facultyText) => setState(
                    //         () => this.facultyText = facultyText as String?),
                    //   ),
                    // ),
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
                      "email",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/homebar");
                          },
                          child: Container(
                            height: 40,
                            width: 130,
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
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      SiamColors.red,
                                      SiamColors.orange
                                    ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                Text(
                                  "ยกเลิก",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                        child: InkWell(
                          onTap: () async {
                            //upload
                            // uploadImageToFirebase(context);
                            //then
                            debugPrint(arguments['docID']);
                            if (imageURL != null) {
                              await users.doc(arguments['docID']).update({
                                "ImageURL": imageURL,
                              });
                            }
                            // await users.update({
                            // "Name": nameController.text,
                            // "Surname": surnameController.text,
                            // "Student ID": studentidController.text,
                            // "Faculty": facultyText,
                            // "ImageURL": imageURL,
                            // "email": emailController.text
                            // });
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.of(context).pushNamed('/homebar');
                                  });
                                  return CupertinoAlertDialog(
                                    content: Column(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: SiamColors.green,
                                          size: 50,
                                        ),
                                        Text('ส่งเรื่องร้องเรียนสำเร็จ'),
                                      ],
                                    ),
                                  );
                                });
                            // } else {
                            //   ScaffoldMessenger.of(context)
                            //       .showSnackBar(snackBar2);
                            // }
                          },
                          child: Container(
                            height: 40,
                            width: 130,
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
                                  Icons.check_outlined,
                                  size: 20,
                                  color: SiamColors.red,
                                ),
                                Text(
                                  "ยืนยันแก้ไข",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: SiamColors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String facultyList) =>
      DropdownMenuItem(
        value: facultyList,
        child: Text(
          facultyList,
          style: TextStyle(fontFamily: 'Roboto', fontSize: 14),
        ),
      );
}
