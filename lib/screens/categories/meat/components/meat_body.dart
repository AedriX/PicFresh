import 'package:flutter/material.dart';
//import 'package:picfresh/components/product_card.dart';
//import 'package:picfresh/models/product.dart';
import 'package:picfresh/models/recipe.dart';
import 'package:picfresh/screens/categories/meat/components/meat_categories_card.dart';

import '../../../../size_config.dart';

class BodyMeat extends StatelessWidget {
  const BodyMeat({Key? key}) : super(key: key); //baru ditambahin

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/banner_1.png"),
        // SizedBox(height: getProportionateScreenWidth(20)),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(5),
            ),
            child: GridView.builder(
              itemCount: meatRecipe.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.75),
              itemBuilder: (context, index) {
                if (meatRecipe[index].isMeatCat)
                  return CategoriesCard(
                    meatrecipe: meatRecipe[index],
                    press: () {}, product: null,
                    // press: () => Navigator.pushNamed(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DetailScreen(
                    //       product: dataProduct[index],
                    //     ),
                    //   ),
                    // ),
                  );

                return SizedBox
                    .shrink(); // here by default width and height is 0
              },
            ),
          ),
        )
      ],
    );
  }
}
