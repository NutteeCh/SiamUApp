import 'package:flutter/material.dart';

bool isImageNull = true;

class SiamColors {
  static const red = Color(0xFFEE292F);
  static const orange = Color(0xFFFF4B2B);
  static const grey = Color(0xFF616161);
  static const green = Color(0xFF15E111);
  static const yellow = Color.fromARGB(255, 255, 213, 0);
}

String userUID = "";
String userName = "";
String userSurname = "";
String userFaculty = "";
String userSID = "";
String userEmail = "";
String userRole = "";

bool roleVisible = false;

final typeList = [
  'การเรียน',
  'ลงทะเบียนเรียน',
  'อาคาร/สถานที่',
  'บุคลากร',
  'โรงอาหาร',
  'ห้องน้ำ',
  'ที่จอดรถ',
  'กิจกรรมภายใน',
  'ภัยรบกวน',
  'อื่นๆ'
];

final facultyList = [
  "คณะสาธารณสุขศาสตร์",
  "คณะเภสัชศาสตร์",
  "คณะวิศวกรรมศาสตร์",
  "คณะศิลปศาสตร์",
  "คณะเทคโนโลยีสารสนเทศ",
  "คณะแพทยศาสตร์",
  "คณะวิทยาศาสตร์",
  "คณะรัฐศาสตร์",
  "คณะพยาบาลศาสตร์",
  "คณะบริหารธุรกิจ",
  "คณะนิเทศศาสตร์",
  "คณะนิติศาสตร์",
  "วิทยาลัยดนตรีและศิลปะการแสดง SCA",
];

final statusReport = [
  "กำลังดำเนินการ", //สีเหลือง
  "ดำเนินการเสร็จสิ้น", // สีเขียว
];

final statusReport2 = [
  "ระบบได้รับคำร้องเรียนแล้ว",
  "กำลังดำเนินการ",
  "ดำเนินการเสร็จสิ้น",
  "ยกเลิกแล้ว"
];
