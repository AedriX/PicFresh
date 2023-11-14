import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:picfresh/theme.dart';

class DetailPageArt extends StatelessWidget {
  final QueryDocumentSnapshot documentSnapshot;
  const DetailPageArt({super.key, required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    //Timestamp t = documentSnapshot["date"] as Timestamp;
    //DateTime date = t.toDate();
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Text(
                  "Judul Artikel Yang Pertama Kali Dipublish",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "published on: 5 - 11 - 2023",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Erwin Surya Effendi",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/artikel1.jpeg'),
                SizedBox(height: 30),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed scelerisque efficitur enim, vel molestie odio tincidunt in. Mauris mattis, ex ut feugiat dictum, dolor diam iaculis orci, et lobortis libero augue eget nunc. Quisque tempor sem ut felis finibus iaculis. Duis ac lectus ac turpis sollicitudin euismod sed ac arcu. In hac habitasse platea dictumst. Integer eget elit hendrerit, egestas turpis vel, rutrum mi. Suspendisse eleifend fringilla molestie. Donec facilisis neque nec nisi lacinia, quis maximus dolor condimentum. Pellentesque eu sem sed ipsum iaculis commodo. Ut nec tortor eu tellus faucibus porta. Ut ultricies sem quis nulla dictum dapibus.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed scelerisque efficitur enim, vel molestie odio tincidunt in. Mauris mattis, ex ut feugiat dictum, dolor diam iaculis orci, et lobortis libero augue eget nunc. Quisque tempor sem ut felis finibus iaculis. Duis ac lectus ac turpis sollicitudin euismod sed ac arcu. In hac habitasse platea dictumst. Integer eget elit hendrerit, egestas turpis vel, rutrum mi. Suspendisse eleifend fringilla molestie. Donec facilisis neque nec nisi lacinia, quis maximus dolor condimentum. Pellentesque eu sem sed ipsum iaculis commodo. Ut nec tortor eu tellus faucibus porta. Ut ultricies sem quis nulla dictum dapibus.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed scelerisque efficitur enim, vel molestie odio tincidunt in. Mauris mattis, ex ut feugiat dictum, dolor diam iaculis orci, et lobortis libero augue eget nunc. Quisque tempor sem ut felis finibus iaculis. Duis ac lectus ac turpis sollicitudin euismod sed ac arcu. In hac habitasse platea dictumst. Integer eget elit hendrerit, egestas turpis vel, rutrum mi. Suspendisse eleifend fringilla molestie. Donec facilisis neque nec nisi lacinia, quis maximus dolor condimentum. Pellentesque eu sem sed ipsum iaculis commodo. Ut nec tortor eu tellus faucibus porta. Ut ultricies sem quis nulla dictum dapibus.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "How do you like the article?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600, 
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: Image.asset(
                        'assets/icons/star.png',
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Image.asset(
                        'assets/icons/star.png',
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Image.asset(
                        'assets/icons/star.png',
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Image.asset(
                        'assets/icons/star.png',
                        width: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Image.asset(
                        'assets/icons/star.png',
                        width: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ));
  }

  Widget _topBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 10, left: 140),
          child: Image.asset(
            ylogo,
            height: 25,
          ),
        )
      ],
    );
  }
}
