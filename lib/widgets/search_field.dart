import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Looking for something?",
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          isDense: true,
        ),
      ),
    );
  }
}