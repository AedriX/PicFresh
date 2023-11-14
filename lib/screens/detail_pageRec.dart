import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:picfresh/model/get_star.dart';
import 'package:picfresh/theme.dart';

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
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          elevation: 0,
          expandedHeight: 275,
          pinned: true,
          stretch: true,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              documentSnapshot["imageUrl"],
              fit: BoxFit.cover,
            ),
            //collapseMode: CollapseMode.pin,
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              height: 32.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
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
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  )),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, bottom: 20),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "(${staraverage.toStringAsPrecision(2)}) ${totalreview.toInt()}",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: const Divider(
                  color: Color(0xFF3C3C3C),
                  height: 2,
                ),
              ),
              Text(
                "Description",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  width: double.infinity,
                  //margin: EdgeInsets.only(left: 20, top: 20),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Text(
                      documentSnapshot["description"],
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 17),
                    ),
                  )),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Divider(
                  color: Color(0xFF3C3C3C),
                  height: 2,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Ingredients",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  //margin: EdgeInsets.only(left: 20),
                  height: 65 * Ingredient.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Ingredient.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            Ingredient[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          leading: Icon(
                            Icons.brightness_1,
                          ),
                        );
                      })),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: const Divider(
                  color: Color(0xFF3C3C3C),
                  height: 2,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Steps",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 80 * Instruction.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Instruction.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            Instruction[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          leading: Icon(Icons.brightness_1),
                        );
                      })),
            ],
          ),
        )
      ],
    ));
  }
}
