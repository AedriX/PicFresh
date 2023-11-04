import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailPageArt extends StatelessWidget {
  final QueryDocumentSnapshot documentSnapshot;
  const DetailPageArt({super.key, required this.documentSnapshot});

  @override
  Widget build(BuildContext context) {
    Timestamp t = documentSnapshot["date"] as Timestamp;
    DateTime date = t.toDate();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 250,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                documentSnapshot["imageUrl"],
                fit: BoxFit.cover,
              ),
              collapseMode: CollapseMode.pin,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text(
                      documentSnapshot["name"],
                      style: TextStyle(fontSize: 22),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                          "publish on : ${date.day} - ${date.month} - ${date.year}"),
                      Spacer(),
                      Text(documentSnapshot["author"])
                    ],
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: Text(
                      documentSnapshot["description"],
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 18),
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
