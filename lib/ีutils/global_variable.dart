import 'package:flutter/material.dart';

class SiamColors {
  static const red = Color(0xFFEE292F);
  static const orange = Color(0xFFFF4B2B);
  static const grey = Color(0xFF616161);
  static const green = Color(0xFF15E111);
}

String userUID = "";
String userName = "";
String userSurname = "";
String userFaculty = "";
String userEmail = "";

final typeList = [
  'การเรียน',
  'ลงทะเบียนเรียน',
  'อาคารสถานที่',
  'ห้องน้ำ',
  'โรงอาหาร',
  'ที่จอดรถ',
  'บุคลากร',
  'กิจกรรมภายใน',
  'ภัยรบกวน',
  'อื่นๆ'
];

final facultyList = [
  "คณะสาธารณสุขศาสตร์",
  "คณะเภสัชศาสตร์",
  "คณะวิศวกรรมศาสตร์",
  "คณะศิลปศาสตร",
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
