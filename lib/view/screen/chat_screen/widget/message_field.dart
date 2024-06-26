import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';

class MessageField extends StatelessWidget {
  const MessageField({super.key, required this.messageController});
  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Card(
      child: SizedBox(
        width: size.width / 1.3,
        child:   TextField(
          controller: messageController,
          minLines: 1,
          maxLines: 5,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              border: InputBorder.none,
              hintText: "Write Message",
              hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 15)),
        ),
      ),
    );
  }
}
