import 'package:flutter/material.dart';
import 'package:picfresh/auth_service.dart';
import "package:firebase_core/firebase_core.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appThemeData = ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      title: 'PicFresh',
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: AuthServices().handleAuthState(),
    );
  }
}
