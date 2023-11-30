import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class PreviewCamera extends StatefulWidget {
  final String imagePath;
  final String name;

  const PreviewCamera({Key? key, required this.imagePath, required this.name})
      : super(key: key);

  @override
  State<PreviewCamera> createState() => _PreviewCameraState();
}

class _PreviewCameraState extends State<PreviewCamera> {
  List? _result;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadModel();
    _classifyImage();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> _loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model/model_${widget.name}.tflite",
        labels: "assets/model/label.txt",
      );
      print("Model loaded successfully");
    } catch (e) {
      print("Failed to load model: $e");
      // Handle error when failing to load model
    }
  }

  Future<void> _classifyImage() async {
    try {
      File image = File(widget.imagePath);
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
          _loading = false;
          print(_result);
        });
      }
    } catch (e) {
      print("Failed to classify image: $e");
      // Handle error when failing to classify image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : (_result != null && _result!.isNotEmpty)
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_result![0]["label"]} - Confidence ${(_result![0]["confidence"] as double).toStringAsFixed(2)}.",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),
            Image.file(File(widget.imagePath)),
          ],
        ),
      )
          : Center(
        child: Text(
          "No predictions available.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}