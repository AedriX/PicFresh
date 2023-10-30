import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final QueryDocumentSnapshot documentSnapshot;
  const DetailPage({super.key, required this.documentSnapshot});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            documentSnapshot["imageUrl"],
            height: MediaQuery.of(context).size.height / 2.5,
            fit: BoxFit.fill,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              documentSnapshot["name"],
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 20),
            child: const Text(
              "Ingredients",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.end,
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.only(left: 30),
          //   child: Text(
          //     documentSnapshot["ingredient"],
          //     style: TextStyle(fontSize: 18),
          //     textAlign: TextAlign.start,
          //   ),
          // ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(right: 20),
            child: const Text(
              "Diraction",
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.end,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 30),
            child: Text(
              documentSnapshot["instruction"],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.start,
            ),
          )
        ]),
      ),
    );
  }
}
