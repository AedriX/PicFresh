import 'package:flutter/material.dart';
import 'package:picfresh/components/main_header.dart';
import 'package:picfresh/screens/article/components/articles.dart';

import '../../../size_config.dart';
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            MainHeader(),
            Articles(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
