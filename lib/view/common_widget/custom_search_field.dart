import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.searchClosed, required this.onChange, required this.onTap, required this.controller});
  final bool searchClosed;
  final Function(String) onChange;
  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: onChange,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "search here",
          suffixIcon: searchClosed ? buildIcon(iconData: Icons.search) : InkWell(onTap: onTap, child: buildIcon(iconData: Icons.close)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    );
  }


  // Custom Icon
  Icon buildIcon({required IconData iconData}) => Icon(iconData, color: Colors.red, size: 20);
}
