
import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          labelText: "Your Full Name",
          hintText: "",
          errorStyle: TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "Please Enter your Name";
        }
        return null;
      },
    );
  }
}