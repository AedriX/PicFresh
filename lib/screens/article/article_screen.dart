import 'package:flutter/material.dart';
import 'package:picfresh/components/custom_bottom_nav_bar.dart';
import 'package:picfresh/enums.dart';
import 'package:picfresh/size_config.dart';

import 'components/article_body.dart';

class ArticleScreen extends StatelessWidget {
  static String routeName = "/article";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.article),
    );
  }
}