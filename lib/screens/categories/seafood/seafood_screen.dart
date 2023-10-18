import 'package:flutter/material.dart';
import 'package:picfresh/screens/categories/seafood/components/seafood_body.dart';

class CategoriesSeafood extends StatelessWidget {
  static String routeName = "/catseafood";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seafood"),
      ),
      body: BodySeafood(),
    );
  }
}
