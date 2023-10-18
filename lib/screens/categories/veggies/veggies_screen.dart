import 'package:flutter/material.dart';
import 'package:picfresh/screens/categories/veggies/components/veggies_body.dart';
// import 'dart:js';

class CategoriesVeggies extends StatelessWidget {
  static String routeName = "/catveggies";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Veggies"),
      ),
      body: BodyVeggies(),
    );
  }
}
