import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:my_chat/view/screen/chat_screen/widget/chatbox_controller.dart';
import 'package:my_chat/view/screen/chat_screen/widget/message_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: "Mamun Islam Mim",
          fontSize: 25,
        ),
        actions: [const CircleAvatar(), buildSizedBox(weight: 8)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.appbarLightColor,
              ),
              buildSizedBox(weight: 5),
              Card(
                shape: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextWidget(
                    text: "Hello,How are you?",
                    fontColor: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MessageField(),
                // ChatBoxController(linkTap: (){}, cameraTap: (){}),
                const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.appbarLightColor,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Custom SizedBox
  SizedBox buildSizedBox({double? height, double? weight}) {
    return SizedBox(
      width: weight ?? 0,
      height: height ?? 0,
    );
  }
}
