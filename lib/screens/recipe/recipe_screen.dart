import 'package:flutter/material.dart';
import 'package:picfresh/components/custom_bottom_nav_bar.dart';
import 'package:picfresh/enums.dart';

import 'components/recipe_body.dart';

class RecipeScreen extends StatelessWidget {
  static String routeName = "/recipe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.recipe),
    );
  }
}
