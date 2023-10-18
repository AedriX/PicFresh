import 'package:flutter/material.dart';
import 'package:picfresh/screens/categories/dessert/components/dessert_body.dart';

class CategoriesDessert extends StatelessWidget {
  static String routeName = "/catdessert";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dessert"),
      ),
      body: BodyDessert(),
    );
  }
}
