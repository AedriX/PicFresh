import 'package:flutter/material.dart';
/*import 'package:picfresh/constants.dart';*/
import 'routes.dart';
import 'package:picfresh/screens/splash/splash_screen.dart';
import 'package:picfresh/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PicFresh',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
