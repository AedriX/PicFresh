import 'package:flutter/material.dart';
import 'package:picfresh/components/main_header.dart';
import 'package:picfresh/screens/home/components/new_article.dart';

import '../../../size_config.dart';
import 'welcome_banner.dart';
import 'recommended_recipe.dart';
import 'new_recipe.dart';

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
            WelcomeBanner(),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            RecommendedRecipe(),
            SizedBox(height: getProportionateScreenWidth(30)),
            NewArticle(),
            SizedBox(height: getProportionateScreenWidth(30)),
            NewRecipe(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
