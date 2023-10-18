import 'package:flutter/material.dart';
import 'package:picfresh/components/custom_bottom_nav_bar.dart';
import 'package:picfresh/enums.dart';
import 'package:picfresh/size_config.dart';

import 'components/home_body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}