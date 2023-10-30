import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:picfresh/screens/detail_page.dart';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: //Search Bar (Start)
            const SizedBox(
          width: double.infinity,
          height: 45,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 211, 211, 211)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Color.fromARGB(255, 211, 211, 211)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: "Looking for something?",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        //Search Bar (End),,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2,
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              expandedTitleScale: 1,
              titlePadding: const EdgeInsets.only(left: 25),
              centerTitle: false,
              title: const Text(
                "New Recipes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              background: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    //Bagian Kotak Warna kuning (Start)
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 6,
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Card(
                        color: Color.fromARGB(255, 255, 217, 0),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                child: Text(
                                  "Hi ${FirebaseAuth.instance.currentUser!.displayName!}!",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //Bagian Kotak Warna kuning (End)
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 10, bottom: 10),
                      child: const Text(
                        "Recommended Recipes",
                        style: TextStyle(fontSize: 20),
                      ),
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
                                            Image.network(
                                              "${data.docs[index]["imageUrl"]}",
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text("${data.docs[index]["name"]}"),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rating ${data.docs[index]["rating"]}",
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
                    Spacer()
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            //Pemanggilan Query Recipes dan Membuat ListView(Start)
            child: Container(
              height: MediaQuery.of(context).size.width,
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
                                            documentSnapshot:
                                                data.docs[index]))),
                                child: Ink(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        "${data.docs[index]["imageUrl"]}",
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text("${data.docs[index]["name"]}"),
                                      Row(
                                        children: [
                                          Text(
                                            "Rating ${data.docs[index]["rating"]}",
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
}
