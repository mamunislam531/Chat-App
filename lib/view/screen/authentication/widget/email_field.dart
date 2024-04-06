
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          labelText: "Email address",
          hintText: "youremail@gmail.com",
          errorStyle: TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "Please Insert your email";
        } else if (!(value.contains("@") &&
            value.contains("."))) {
          return "Sorry, wrong email address";
        }
        return null;
      },
    );
  }
}