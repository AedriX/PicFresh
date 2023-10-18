import 'package:flutter/material.dart';

import 'components/meat_body.dart';

class CategoriesMeat extends StatelessWidget {
  static String routeName = "/catmeat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meat"),
      ),
      body: BodyMeat(),
    );
  }
}
