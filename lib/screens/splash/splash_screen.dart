import 'package:flutter/material.dart';
import 'package:picfresh/screens/splash/components/splash_body.dart';
import 'package:picfresh/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
