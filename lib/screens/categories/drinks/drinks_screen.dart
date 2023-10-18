import 'package:flutter/material.dart';
import 'package:picfresh/screens/categories/drinks/components/drinks_body.dart';

class CategoriesDrinks extends StatelessWidget {
  static String routeName = "/catdrinks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks"),
      ),
      body: BodyDrinks(),
    );
  }
}
