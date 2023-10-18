import 'package:flutter/material.dart';
import 'package:picfresh/components/custom_bottom_nav_bar.dart';
import 'package:picfresh/screens/favorite/components/favorite_body.dart';

import '../../enums.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = "/favorite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favorite),
    );
  }
}
