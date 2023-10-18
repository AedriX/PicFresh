import 'package:flutter/material.dart';
import 'package:picfresh/components/product_card.dart';
import 'package:picfresh/models/product.dart';

import '../../../size_config.dart';
import '../../home/components/section_title.dart';

class Drinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Drinks", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                dataProduct.length,
                (index) {
                  if (dataProduct[index].isDrinks)
                    return ProductCard(product: dataProduct[index]);

                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
