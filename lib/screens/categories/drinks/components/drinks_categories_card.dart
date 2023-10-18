import 'package:flutter/material.dart';
import 'package:picfresh/models/product.dart';
import 'package:picfresh/models/recipe.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    Key? key,
    @required this.product,
    this.press,
    this.drinksrecipe,
  }) : super(key: key);

  // final double width, aspectRetio;
  final Product? product;
  final DrinksRecipe? drinksrecipe;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            drinksrecipe!.images[0],
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          drinksrecipe!.title,
          style: TextStyle(color: Colors.black),
          maxLines: 2,
        ),
      ],
    );
  }
}
