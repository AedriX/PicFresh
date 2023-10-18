/*import 'package:flutter/material.dart';*/

class MeatRecipe {
  final int id;
  final List<String> images;
  final String title;
  final bool isMeatCat;

  MeatRecipe ({
    required this.id,
    required this.images,
    required this.title,
    this.isMeatCat = false,
  });
}

class SeafoodRecipe {
  final int id;
  final List<String> images;
  final String title;
  final bool isSeafoodCat;

  SeafoodRecipe ({
    required this.id,
    required this.images,
    required this.title,
    this.isSeafoodCat = false,
  });
}

class VeggiesRecipe {
  final int id;
  final List<String> images;
  final String title;
  final bool isVeggiesCat;

  VeggiesRecipe ({
    required this.id,
    required this.images,
    required this.title,
    this.isVeggiesCat = false,
  });
}

class DessertRecipe {
  final int id;
  final List<String> images;
  final String title;
  final bool isDessertCat;

  DessertRecipe ({
    required this.id,
    required this.images,
    required this.title,
    this.isDessertCat = false,
  });
}

class DrinksRecipe {
  final int id;
  final List<String> images;
  final String title;
  final bool isDrinksCat;

  DrinksRecipe ({
    required this.id,
    required this.images,
    required this.title,
    this.isDrinksCat = false,
  });
}

List<MeatRecipe> meatRecipe = [
  MeatRecipe(
    id: 1,
    images: [
      "assets/images/foods/rendang.jpg",
    ],
    title: "Rendang",
    isMeatCat: true,
  ),
  MeatRecipe(
    id: 2,
    images: [
      "assets/images/foods/rawon.jpg",
    ],
    title: "Rawon",
    isMeatCat: true,
  ),
  MeatRecipe(
    id: 3,
    images: [
      "assets/images/foods/sate_ayam.jpg",
    ],
    title: "Sate Ayam",
    isMeatCat: true,
  ),
  MeatRecipe(
    id: 4,
    images: [
      "assets/images/foods/ayam_rica_rica.jpg",
    ],
    title: "Ayam Rica-Rica",
    isMeatCat: true,
  ),
];

List<SeafoodRecipe> seafoodRecipe = [
  SeafoodRecipe(
    id: 1,
    images: [
      "assets/images/foods/ikan_nila_goreng.jpg",
    ],
    title: "Ikan Nila Goreng",
    isSeafoodCat: true,
  ),
  SeafoodRecipe(
    id: 2,
    images: [
      "assets/images/foods/cumi_goreng_tepung.jpeg",
    ],
    title: "Cumi Goreng Tepung",
    isSeafoodCat: true,
  ),
  SeafoodRecipe(
    id: 3,
    images: [
      "assets/images/foods/udang_balado.jpg",
    ],
    title: "Udang Balado",
    isSeafoodCat: true,
  ),
  SeafoodRecipe(
    id: 4,
    images: [
      "assets/images/foods/kerang_hijau_saus_padang.jpg",
    ],
    title: "Kerang Hijau Saus Padang",
    isSeafoodCat: true,
  ),
];

List<VeggiesRecipe> veggiesRecipe = [
  VeggiesRecipe(
    id: 1,
    images: [
      "assets/images/foods/cah_kangkung.jpg",
    ],
    title: "Cah Kangkung",
    isVeggiesCat: true,
  ),
  VeggiesRecipe(
    id: 2,
    images: [
      "assets/images/foods/brokoli_tumis_bawang_putih.jpg",
    ],
    title: "Brokoli Tumis Bawang Putih",
    isVeggiesCat: true,
  ),
  VeggiesRecipe(
    id: 3,
    images: [
      "assets/images/foods/salad.jpg",
    ],
    title: "Salad",
    isVeggiesCat: true,
  ),
  VeggiesRecipe(
    id: 4,
    images: [
      "assets/images/foods/capcay.jpg",
    ],
    title: "Capcay",
    isVeggiesCat: true,
  ),
];

List<DessertRecipe> dessertRecipe = [
  DessertRecipe(
    id: 1,
    images: [
      "assets/images/foods/dessert_box_cheesecake_oreo.jpg",
    ],
    title: "Dessert Box Cheesecake Oreo",
    isDessertCat: true,
  ),
  DessertRecipe(
    id: 2,
    images: [
      "assets/images/foods/es_krim_kelapa_muda.jpg",
    ],
    title: "Es Kelapa Muda",
    isDessertCat: true,
  ),
  DessertRecipe(
    id: 3,
    images: [
      "assets/images/foods/red_velvet_cake.jpg",
    ],
    title: "Red Velvet Cake",
    isDessertCat: true,
  ),
  DessertRecipe(
    id: 4,
    images: [
      "assets/images/foods/caramel_custard_pudding.jpg",
    ],
    title: "Caramel Custard Pudding",
    isDessertCat: true,
  ),
];

List<DrinksRecipe> drinksRecipe = [
  DrinksRecipe(
    id: 1,
    images: [
      "assets/images/foods/boba_gula_aren.jpg",
    ],
    title: "Boba Milk Gula Aren",
    isDrinksCat: true,
  ),
  DrinksRecipe(
    id: 2,
    images: [
      "assets/images/foods/wedang_jahe.jpg",
    ],
    title: "Wedang Jahe",
    isDrinksCat: true,
  ),
  DrinksRecipe(
    id: 3,
    images: [
      "assets/images/foods/es_cendol.jpg",
    ],
    title: "Es Cendol",
    isDrinksCat: true,
  ),
  DrinksRecipe(
    id: 4,
    images: [
      "assets/images/foods/dalgona_coffee.jpg",
    ],
    title: "Dalgona Coffee",
    isDrinksCat: true,
  ),
];
