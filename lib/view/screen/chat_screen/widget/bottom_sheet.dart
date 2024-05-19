import 'package:flutter/material.dart';
import 'package:my_chat/controller/ui_controller/chat_screen.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key, required this.controller, required this.myDocID, required this.senderID});
  final ChatScreenController controller;
  final String myDocID;
  final String senderID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 100,
                      color: Colors.grey,
                    ),
                    CustomTextWidget(text: "Camera"),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  await controller.imagePicker();
                  await controller.setImages(myDocID: myDocID, senderID: senderID);
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.photo,
                      size: 100,
                      color: Colors.grey,
                    ),
                    CustomTextWidget(text: "Gallery"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
