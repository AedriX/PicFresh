import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
/*import 'package:picfresh/constants.dart';*/
import 'package:picfresh/screens/categories/dessert/dessert_screen.dart';
import 'package:picfresh/screens/categories/drinks/drinks_screen.dart';
import 'package:picfresh/screens/categories/meat/meat_screen.dart';
import 'package:picfresh/screens/categories/seafood/seafood_screen.dart';
import 'package:picfresh/screens/categories/veggies/veggies_screen.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "icon": "assets/icons/categories_meat.svg",
        "text": "Meat",
        "press": () => Navigator.pushNamed(context, CategoriesMeat.routeName),
      },
      {
        "icon":"assets/icons/categories_seafood.svg",
        "text": "Seafood",
        "press": () => Navigator.pushNamed(context, CategoriesSeafood.routeName),
      },
      {
        "icon": "assets/icons/categories_veggies.svg",
        "text": "Veggies",
        "press": () => Navigator.pushNamed(context, CategoriesVeggies.routeName),
      },
      {
        "icon": "assets/icons/categories_dessert.svg",
        "text": "Dessert",
        "press": () => Navigator.pushNamed(context, CategoriesDessert.routeName),
      },
      {
        "icon": "assets/icons/categories_drinks.svg",
        "text": "Drinks",
        "press": () => Navigator.pushNamed(context, CategoriesDrinks.routeName),
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: categories[index]["press"],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFD733),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
