import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';

class ChatBoxController extends StatelessWidget {
  const ChatBoxController({super.key, required this.linkTap, required this.cameraTap});
  final VoidCallback linkTap;
  final VoidCallback cameraTap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Card(
      child: SizedBox(
          //height: 50,
          width: size.width / 1.3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomTextWidget(
                  text: "Write Message",
                  fontSize: 15,
                  fontColor: AppColors.greyColor,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: linkTap,
                      child: const Icon(
                        Icons.insert_link_outlined,
                        size: 30,
                        color: AppColors.greyColor,
                      ),
                    ),
                    buildSizedBox(weight: 20),
                    InkWell(
                      onTap: cameraTap,
                      child: const Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
