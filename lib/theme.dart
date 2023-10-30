import 'package:flutter/material.dart';

const primaryColor = Color(0xFFFFD015);
const primarySwatch = Color(0xff556e51);
const fontColor = Color(0xff3C3C43);
//const Color g1 = Color(0xFFECDDA7);
//const Color g2 = Color(0xFFE3C37D);
const Color kButtonColor = Color(0xffffc200);
const Color kWhiteColor = Colors.white;

String image1 = "assets/images/login.png";
String image2 = "assets/google.png";

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}