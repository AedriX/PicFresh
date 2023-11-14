import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class PreviewCamera extends StatefulWidget {
  final String imagePath;
  final String name;
  const PreviewCamera({super.key, required this.imagePath, required this.name});

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  List? _result;

  @override
  void initState() {
    super.initState();
    loadModel();
    File image = File(widget.imagePath);
    imageClassification(image);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: "assets/model/model_${widget.name}.tflite",
        labels: "assets/model/label.txt");
    print("Load model Sucessfully");
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: (_result) != null
              ? _result!.map((result) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${result["label"]} - Confidence ${result["confidence"].toStringAsFixed(2)}.",
                          style: TextStyle(fontSize: 22),
                        ),
                        Image.file(File(widget.imagePath)),
                      ],
                    ),
                  );
                }).toList()
              : [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                ],
        ));
  }

  Future imageClassification(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    if (mounted) {
      setState(() {
        _result = recognitions!;
        print(_result);
      });
    }
    ;
  }
}
