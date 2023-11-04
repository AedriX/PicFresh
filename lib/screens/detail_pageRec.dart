import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:picfresh/model/get_star.dart';

class DetailPage extends StatelessWidget {
  final QueryDocumentSnapshot documentSnapshot;
  DetailPage({super.key, required this.documentSnapshot});
  @override
  Widget build(BuildContext context) {
    List Ingredient = documentSnapshot["ingredient"];
    List Instruction = documentSnapshot["instruction"];
    List Rating = documentSnapshot["rating"];
    double staraverage = avgRating(Rating, 4);
    double totalreview = sumRating(Rating, 4);

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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  )),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      RatingBar.builder(
                          itemSize: 20,
                          ignoreGestures: true,
                          initialRating: staraverage,
                          allowHalfRating: true,
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {}),
                      Text(
                        "(${staraverage.toStringAsPrecision(2)}) ${totalreview.toInt()}",
                        textAlign: TextAlign.left,
                      ),
                    ],
                  )),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    documentSnapshot["description"],
                    style: TextStyle(fontSize: 18),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "INGREDIENT",
                style: TextStyle(fontSize: 24),
              ),
              Container(
                width: double.infinity,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 40 * Ingredient.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Ingredient.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.asset(
                              "assets/icons/leaf.png",
                              height: 25,
                            ),
                            Text(Ingredient[index])
                          ],
                        );
                      })),
              Text(
                "HOW TO COOK",
                style: TextStyle(fontSize: 24),
              ),
              Container(
                width: double.infinity,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                margin: EdgeInsets.only(left: 20, right: 20),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 40 * Ingredient.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Instruction.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Image.asset(
                              "assets/icons/leaf.png",
                              height: 25,
                            ),
                            Container(
                              child: Text(
                                Instruction[index],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        );
                      })),
              Container(
                height: 200,
                child: ListView.builder(
                    itemCount: Rating.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          RatingBar.builder(
                              itemSize: 20,
                              ignoreGestures: true,
                              initialRating: index.toDouble() + 1,
                              allowHalfRating: true,
                              itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {}),
                          Text(
                            "${index + 1} ${Rating[index]}",
                            textAlign: TextAlign.left,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
