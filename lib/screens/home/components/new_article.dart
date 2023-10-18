import 'package:flutter/material.dart';
import 'package:picfresh/components/article_card.dart';
import 'package:picfresh/models/article.dart';
/*import 'package:picfresh/screens/details/details_screen.dart';*/

import '../../../size_config.dart';
import 'section_title.dart';

class NewArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "New Article", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                dataArticle.length,
                (index) {
                  if (dataArticle[index].isNewArticle)
                    return ArticleCard(article: dataArticle[index]);
                    
                  return SizedBox
                      .shrink(); // here by default width and height is 0
                }
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
