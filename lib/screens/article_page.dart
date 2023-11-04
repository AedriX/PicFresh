import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:picfresh/theme.dart';
import 'package:picfresh/widgets/search_field.dart';
import 'detail_pageArt.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final Stream<QuerySnapshot> article =
      FirebaseFirestore.instance.collection("article").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: article,
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

            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  Timestamp t = data.docs[index]["date"] as Timestamp;
                  DateTime date = t.toDate();
                  //Bagian tampilan Recommended Recipes (Start)
                  return Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(3),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPageArt(
                                    documentSnapshot: data.docs[index]))),
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image.network(
                                  "${data.docs[index]["imageUrl"]}",
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 12),
                                child: Text(
                                  "${data.docs[index]["name"]}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 12, right: 12),
                                child: Row(
                                  children: [
                                    Text(
                                      "publish on : ${date.day} - ${date.month} - ${date.year}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Spacer(),
                                    Text(
                                      "by : ${data.docs[index]["author"]}",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(12),
                                child: Text(
                                  data.docs[index]["description"],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
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
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(110),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
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
