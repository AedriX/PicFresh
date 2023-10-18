/*import 'package:flutter/material.dart';*/

class Article {
  final int id;
  final List<String> images;
  final String title, description;
  final bool isFavourite, isNewArticle, isMostRead;

  Article({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    this.isFavourite = false,
    this.isNewArticle = false,
    this.isMostRead = false,
  });
}

List<Article> dataArticle = [
  Article(
    id: 1,
    images: [
      "assets/images/article_pic/article_1.jpg",
    ],
    title: "Tips Memilih Sayur-Sayuran Yang Segar",
    description: description,
    isFavourite: false,
    isNewArticle: true,
    isMostRead: false,
  ),
  Article(
    id: 2,
    images: [
      "assets/images/article_pic/article_2.jpg",
    ],
    title: "Cara Mengawetkan Makanan di Rumah",
    description: description,
    isFavourite: false,
    isNewArticle: true,
    isMostRead: false,
  ),
];

const String description =
"Tidak semua bahan makanan bisa bertahan lama sehingga mau tidak mau harus diawetkan. Pengawetan bertujuan agar makanan bisa bertahan dalam jangka waktu yang cukup lama, yakni bisa lebih dari satu bulan lamanya. Ada banyak sekali teknik pengawetan makanan yang digunakan. Pemilihan teknik pengawetan ini berdasarkan jenis makanan karena tidak semua makanan cocok diawetkan dengan teknik tertentu. Lantas, ada teknik pengawetan apa saja yang paling banyak digunakan dalam makanan? Yuk, kita bahas satu-satu!";