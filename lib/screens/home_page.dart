import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:picfresh/model/get_star.dart';
import 'package:picfresh/screens/detail_pageRec.dart';
import 'package:picfresh/theme.dart';
import 'package:picfresh/widgets/search_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> recipe =
      FirebaseFirestore.instance.collection("recipe").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.5,
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.only(left: 25, bottom: 15),
              centerTitle: false,
              title: const Text(
                "New Recipes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              background: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: const Text(
                        "Recommended Recipes",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //Pemanggilan Query Recipes dan Membuat ListView(Start)
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: recipe,
                        builder: (
                          BuilderContext,
                          AsyncSnapshot<QuerySnapshot> snapshot,
                        ) {
                          if (snapshot.hasError) {
                            return Text("Cek Koneksi internet anda");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            );
                          }

                          final data = snapshot.requireData;

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: data.size < 5 ? data.size : 5,
                              itemBuilder: (context, index) {
                                double staraverage =
                                    avgRating(data.docs[index]["rating"], 4);
                                //Bagian tampilan Recommended Recipes (Start)
                                return Container(
                                  padding: EdgeInsets.all(3),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  documentSnapshot:
                                                      data.docs[index]))),
                                      child: Ink(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                              child: Image.network(
                                                "${data.docs[index]["imageUrl"]}",
                                                fit: BoxFit.cover,
                                                height: 100,
                                                width: double.infinity,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: double.infinity,
                                              height: 40,
                                              padding:
                                                  EdgeInsets.only(left: 12),
                                              child: Text(
                                                "${data.docs[index]["name"]}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                RatingBar.builder(
                                                    itemSize: 20,
                                                    ignoreGestures: true,
                                                    initialRating: staraverage,
                                                    allowHalfRating: true,
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                        ),
                                                    onRatingUpdate:
                                                        (rating) {}),
                                                Text(
                                                  "(${staraverage.toStringAsPrecision(2)})",
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                                //Bagian tampilan Recommended Recipes (end)
                              });
                        },
                      ),
                    ),
                    //Pemanggilan Query Recipes dan Membuat ListView(End)
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            //Pemanggilan Query Recipes dan Membuat ListView(Start)
            child: Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: StreamBuilder<QuerySnapshot>(
                stream: recipe,
                builder: (
                  BuilderContext,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Text("Cek Koneksi internet anda");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  final data = snapshot.requireData;

                  return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: data.size < 20 ? data.size : 20,
                      itemBuilder: (context, index) {
                        double staraverage =
                            avgRating(data.docs[index]["rating"], 4);
                        //Bagian tampilan New Recipes (Start)
                        return GridTile(
                          child: Container(
                            padding: EdgeInsets.all(3),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        documentSnapshot: data.docs[index]),
                                  ),
                                ),
                                child: Ink(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.network(
                                          "${data.docs[index]["imageUrl"]}",
                                          height: 100,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 40,
                                        padding: EdgeInsets.only(left: 12),
                                        child: Text(
                                          "${data.docs[index]["name"]}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          RatingBar.builder(
                                              itemSize: 14,
                                              ignoreGestures: true,
                                              initialRating: staraverage,
                                              allowHalfRating: true,
                                              itemBuilder: (context, _) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                              onRatingUpdate: (rating) {}),
                                          Text(
                                            "(${staraverage.toStringAsPrecision(2)})",
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                        //Bagian tampilan New Recipes (End)
                      });
                },
              ),
            ),
            //Pemanggilan Query Recipes dan Membuat ListView(End)
          ),
        ],
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(180),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
            _greeting(),
            SizedBox(height: 5),
            const SearchField(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ));
  }

  Widget _greeting() {
    return Row(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
          child: Text(
            'Hello, \n${FirebaseAuth.instance.currentUser!.displayName!}!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
      ],
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35, bottom: 10, left: 140),
          child: Image.asset(
            ylogo,
            height: 25,
          ),
        )
      ],
    );
  }
}
