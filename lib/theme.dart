import 'package:flutter/material.dart';

const bottomNavbarItemSize = 24.0;
const categoryCardImageSize = 120.0;

const primaryColor = Color(0xFFFFD015);
const primarySwatch = Color(0xff556e51);
const fontColor = Color(0xff3C3C43);
//const Color g1 = Color(0xFFECDDA7);
//const Color g2 = Color(0xFFE3C37D);
const Color kButtonColor = Color(0xffffc200);
const Color kWhiteColor = Colors.white;

String logo = "assets/images/piclogo.jpg";
String ylogo = "assets/images/ypiclogo.png";
String image1 = "assets/images/login.png";
String image2 = "assets/google.png";
String navBar1 = "assets/icons/home.png";
String navBar11 = "assets/icons/home-outlined.png";
String navBar2 = "assets/icons/article.png";
String navBar22 = "assets/icons/article-outlined.png";
String navBar3 = "assets/icons/camera.png";
String navBar33 = "assets/icons/camera-outlined.png";
String navBar4 = "assets/icons/star.png";
String navBar44 = "assets/icons/star-outlined.png";
String navBar5 = "assets/icons/user.png";
String navBar55 = "assets/icons/user-outlined.png";

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}