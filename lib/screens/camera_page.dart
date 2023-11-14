import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:picfresh/screens/predict_page.dart';
import 'package:picfresh/theme.dart';

class CameraPage extends StatefulWidget {
  final String get_name;
  const CameraPage({super.key, required this.get_name});
  @override
  State<CameraPage> createState() => _CameraPageState(this.get_name);
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late Future<void> _initializeControllerFutur;

  String get_name;

  _CameraPageState(this.get_name);

  @override
  void initState() {
    super.initState();
    controller = CameraController(
        CameraDescription(
            name: "0",
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 1),
        ResolutionPreset.medium);
    _initializeControllerFutur = controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            FutureBuilder<void>(
                future: _initializeControllerFutur,
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    //Camera
                    return Container(
                      margin: EdgeInsets.all(20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.2,
                      child: CameraPreview(
                        controller,
                      ),
                    );
                    //Camera
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(320, 55),
                  primary: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
                onPressed: () async {
                  try {
                    final image = await controller.takePicture();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PreviewCamera(
                            imagePath: image.path, name: get_name)));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("SCAN ME !")),
            Spacer(),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
            SizedBox(height: 5),
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

class Item {
  final String image, name;

  Item({
    required this.image,
    required this.name,
  });
}

final List<Item> Items_data = [
  Item(
    image: "assets/images/items/Bayem.jpg",
    name: "Bayam",
  ),
  Item(
    image: "assets/images/items/Kentang.jpg",
    name: "Kentang",
  ),
  Item(
    image: "assets/images/items/Kubis.jpg",
    name: "Kubis",
  ),
  Item(
    image: "assets/images/items/Okra.jpg",
    name: "Okra",
  ),
  Item(
    image: "assets/images/items/Pare.png",
    name: "Pare",
  ),
  Item(
    image: "assets/images/items/Paprika.webp",
    name: "Paprika",
  ),
  Item(
    image: "assets/images/items/Timun.webp",
    name: "Timun",
  ),
  Item(
    image: "assets/images/items/Tomat.webp",
    name: "Tomat",
  ),
  Item(
    image: "assets/images/items/Wortel.jpg",
    name: "Wortel",
  ),
];

class CameraListItemPage extends StatelessWidget {
  const CameraListItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: GridView.builder(
        itemCount: Items_data.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              padding: EdgeInsets.all(3),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CameraPage(get_name: Items_data[index].name),
                    ),
                  ),
                  child: Ink(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            Items_data[index].image,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              Items_data[index].name,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            _topBar(),
            SizedBox(height: 5),
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
