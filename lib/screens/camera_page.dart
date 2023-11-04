import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:picfresh/theme.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  late Future<void> _initializeControllerFutur;

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
                        builder: (context) =>
                            PreviewCamera(imagePath: image.path)));
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

class PreviewCamera extends StatelessWidget {
  final String imagePath;
  const PreviewCamera({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    print(imagePath);
    return Image.file(File(imagePath));
  }
}
