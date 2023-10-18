import 'package:flutter/material.dart';
import 'package:picfresh/components/article_card.dart';
import 'package:picfresh/models/article.dart';

import '../../../size_config.dart';
import '../../home/components/section_title.dart';

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Articles", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ...List.generate(
                dataArticle.length,
                (index) {
                  // if (dataArticle[index].isFavourite)
                    return ArticleCard(article: dataArticle[index]);

                  /*return SizedBox
                      .shrink();*/ // here by default width and height is 0
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
