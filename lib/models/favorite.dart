import 'package:flutter/material.dart';

import 'Product.dart';
/*import 'Product.dart';*/

class Favourite {
  final Product? product;
  final int? numOfItem;

  Favourite({@required this.product, @required this.numOfItem});
}

// Demo data for our cart

List<Favourite> dataFavourite = [
  Favourite(product: dataProduct[0], numOfItem: 2),
  Favourite(product: dataProduct[1], numOfItem: 1),
  Favourite(product: dataProduct[3], numOfItem: 1),
];
