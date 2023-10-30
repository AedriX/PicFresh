import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'services/auth_service.dart';
import 'onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appThemeData = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      title: 'PicFresh',
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home:
          isViewed != 0 ? OnBoardingScreen() : AuthServices().handleAuthState(),
      //home: const HomePage(),
    );
  }
}
