
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          labelText: "Phone",
          hintText: "017********",
          errorStyle: TextStyle(fontSize: 12)),
      validator: (value) {
        if (value == null || value == '') {
          return "Please Insert your Phone Number";
        } else if (value.toString().length < 11) {
          return "Sorry, wrong Phone number";
        }
        return null;
      },
    );
  }
}