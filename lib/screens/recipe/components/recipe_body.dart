import 'package:flutter/material.dart';
import 'package:picfresh/components/main_header.dart';
import 'package:picfresh/screens/recipe/components/dessert.dart';
import 'package:picfresh/screens/recipe/components/drinks.dart';
import 'package:picfresh/screens/recipe/components/meat.dart';
import 'package:picfresh/screens/recipe/components/seafood.dart';
import 'package:picfresh/screens/recipe/components/veggies.dart';
import 'package:picfresh/screens/recipe/components/popular_recipe.dart';

import '../../../size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            MainHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularRecipe(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Meat(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Seafood(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Veggies(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Dessert(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Drinks(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
