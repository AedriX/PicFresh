/*import 'package:flutter/material.dart';*/

class Product {
  final int id;
  final List<String> images;
  final String title;
  final String description;
  final bool isFavourite,
      isRecommended,
      isNewRecipe,
      isMeat,
      isSeafood,
      isVeggies,
      isDessert,
      isDrinks;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.description,
    this.isFavourite = false,
    this.isRecommended = false,
    this.isNewRecipe = false,
    this.isMeat = false,
    this.isSeafood = false,
    this.isVeggies = false,
    this.isDessert = false,
    this.isDrinks = false,
  });
}

// Our demo Products

List<Product> dataProduct = [
  Product(
    id: 1,
    images: [
      "assets/images/foods/rendang.jpg",
    ],
    title: "Rendang",
    description: description,
    isFavourite: true,
    isRecommended: false,
    isNewRecipe: true,
    isMeat: true,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/foods/rawon.jpg",
    ],
    title: "Rawon",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: true,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/foods/sate_ayam.jpg",
    ],
    title: "Sate Ayam",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: true,
    isMeat: true,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/foods/ayam_rica_rica.jpg",
    ],
    title: "Ayam Rica-Rica",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: true,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 5,
    images: [
      "assets/images/foods/ikan_nila_goreng.jpg",
    ],
    title: "Ikan Nila Goreng",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: true,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 6,
    images: [
      "assets/images/foods/cumi_goreng_tepung.jpeg",
    ],
    title: "Cumi Goreng Tepung",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: true,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 7,
    images: [
      "assets/images/foods/udang_balado.jpg",
    ],
    title: "Udang Balado",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: true,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 8,
    images: [
      "assets/images/foods/kerang_hijau_saus_padang.jpg",
    ],
    title: "Kerang Hijau Saus Padang",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: true,
    isMeat: false,
    // isSeafood: true,
    isVeggies: false,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 9,
    images: [
      "assets/images/foods/cah_kangkung.jpg",
    ],
    title: "Cah Kangkung",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: true,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 10,
    images: [
      "assets/images/foods/brokoli_tumis_bawang_putih.jpg",
    ],
    title: "Brokoli Tumis Bawang Putih",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: true,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 11,
    images: [
      "assets/images/foods/salad.jpg",
    ],
    title: "Salad",
    description:
        "Bahan:\n1 bonggol selada\n1 buah mentimun\n1 buah wortel\n2 buah tomat\n5 buah blueberry\n1/4 butir bawang bombay\n\nSalad Dressing:\n3 sdm minyak zaitun\n1 sdt oregano kering\n1/4 sdt garam\n\nCara Membuat:\n1. Cuci bersih semua bahan sayur dan buah. Potong-potong secukupnya.\n2. Tata semua bahan sayur dan buah di piring. Tambahkan irisan keju dan bawang bombay.\nCampur semua bahan dressing. Aduk rata.\nSiramkan dressing ke salad. Aduk rata. Salad sayur sederhana siap dinikmati.",
    isFavourite: false,
    isRecommended: true,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: true,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 12,
    images: [
      "assets/images/foods/capcay.jpg",
    ],
    title: "Capcay",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    // isVeggies: true,
    isDessert: false,
    isDrinks: false,
  ),
  Product(
    id: 13,
    images: [
      "assets/images/foods/dessert_box_cheesecake_oreo.jpg",
    ],
    title: "Dessert Box Cheesecake Oreo",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: true,
    isDrinks: false,
  ),
  Product(
    id: 14,
    images: [
      "assets/images/foods/es_krim_kelapa_muda.jpg",
    ],
    title: "Es Kelapa Muda",
    description:
        "Bahan:\nAir kelapa muda 100 ml\nDaging kelapa muda 200 gram\nSusu segar 1/2 liter\nKrim kental (creamer) sebanyak 100 ml\nTelur ayam 3 butir (ambil kuning-nya dan kocok lepas)\nTepung maizena 1 sendok makan (campurkan dengan sedikit air hingga larut)\n\nCara Membuat:\n1. Campur-kan susu segar dengan air kelapa muda dalam wadah atau panci, lalu aduk-aduk hingga rata.\n2. Kemudian masak sembari di aduk-aduk diatas api yang kecil, aduk-aduk terus selama dipanaskan.\n3. Selanjutnya silahkan masukkan larutan tepung maizena kedalam campuran air kelapa muda yang sedang dipanaskan, dan di aduk-aduk terus sampai mendidih.\n4. Kemudian ambil sedikit adonan es krim kelapa muda lalu campur-kan dan aduk bersama kuning telur.\n5. Langkah selanjutnya masukkan kembali campuran kuning telur kedalam cairan kelapa muda, masak dan aduk-aduk sebentar sampai mendidih. Kemudian angkat dan tiriskan.\n6. Setelah itu masukkan daging kelapa muda dan krim, lalu aduk-aduk rata, dan biarkan menjadi dingin.\n7. Jika sudah menjadi dingin, selanjutnya tuangkan dalam wadah lalu masukkan ke dalam freezer sampai agak beku.\n8. Setelah agak beku kemudian dikeluarkan dari freezer, kemudian halus-kan dengan mengunakan mixer dan aduk-aduk terus hingga lembut.\n9. Kemudian tuangkan dalam wadah dan simpan kembali dalam freezer sampai membeku.\n10. Setelah es krim kelapa muda membeku dapat Anda sajikan dalam gelas kecil dan Siap untuk dinikmati.",
    isFavourite: true,
    isRecommended: true,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: true,
    isDrinks: false,
  ),
  Product(
    id: 15,
    images: [
      "assets/images/foods/red_velvet_cake.jpg",
    ],
    title: "Red Velvet Cake",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: true,
    isDrinks: false,
  ),
  Product(
    id: 16,
    images: [
      "assets/images/foods/caramel_custard_pudding.jpg",
    ],
    title: "Caramel Custard Pudding",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    // isDessert: true,
    isDrinks: false,
  ),
  Product(
    id: 17,
    images: [
      "assets/images/foods/boba_gula_aren.jpg",
    ],
    title: "Boba Milk Gula Aren",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: true,
  ),
  Product(
    id: 18,
    images: [
      "assets/images/foods/wedang_jahe.jpg",
    ],
    title: "Wedang Jahe",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: true,
  ),
  Product(
    id: 19,
    images: [
      "assets/images/foods/es_cendol.jpg",
    ],
    title: "Es Cendol",
    description: description,
    isFavourite: false,
    isRecommended: false,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    isDrinks: true,
  ),
  Product(
    id: 20,
    images: [
      "assets/images/foods/dalgona_coffee.jpg",
    ],
    title: "Dalgona Coffee",
    description: "Bahan:\n"
        "2 sdm kopi instan murni tanpa ampas\n"
        "2 sdm gula pasir\n"
        "100 ml susu full cream\n\n"
        "Alat:\n"
        "Sendok takar atau sendok makan\n"
        "Piring plastik\n"
        "Saringan stainless steel ukuran kecil\n"
        "Gelas transparan\n\n"
        "Cara Membuat:\n"
        "1. Siapkan piring plastik. Masukkan kopi instan, gula pasir dan air panas. Aduk memutar pakai saringan.\n"
        "   Pastikan Saringan mengenai dasar piring plastik agar proses mengaduk lebih mudah dan foam kopi terbentuk dengan sempurna.\n"
        "2. Aduk terus sampai foam mulai padat. Proses mengaduk bisa memakan waktu 3-6 menit tergantung kecepatan tangan. Semakin lama mengaduk, tekstur foam akan lebih padat.\n"
        "3. Pada gelas, tuang susu full cream. Tidak usah sampai penuh, cukup 3/4 gelas. Masukkan foam kopi ke atas susu. Lakukan perlahan, jangan sampai foam tenggelam.\n"
        "4. Sajikan Dalgona Coffee dengan pancake manis.",
    isFavourite: false,
    isRecommended: true,
    isNewRecipe: false,
    isMeat: false,
    isSeafood: false,
    isVeggies: false,
    isDessert: false,
    // isDrinks: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";

// const String descriptionsalad =
//     "Bahan:\n1 bonggol selada\n1 buah mentimun\n1 buah wortel\n2 buah tomat\n5 buah blueberry\n1/4 butir bawang bombay";
