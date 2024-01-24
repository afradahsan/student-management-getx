import 'package:flutter/material.dart';

class AddTextFeild extends StatelessWidget {
  const AddTextFeild({super.key, required this.controller, required this.hintText});

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // style: TextStyle(color: Colors.black),
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber)),
                  // hintStyle: TextStyle(color: Colors.white)
                  ),
            );
  }
}