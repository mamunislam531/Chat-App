import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/ui_controller/chat_list.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_search_field.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:my_chat/view/screen/chat_screen/chat_screen.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    ChatListController chatListController = Get.put(ChatListController());
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.appbarLightColor,
        title: const CustomTextWidget(
          text: "Chat List",
          fontColor: AppColors.primaryLightColor,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.zero,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
              borderSide: BorderSide.none,
            ),
            surfaceTintColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                            ),
                          );
                        }),
                  ),
                  buildSizedBox(height: 10),
                  CustomSearchField(searchClosed: true, onChange: (b) {}, onTap: () {}, controller: chatListController.searchController)
                ],
              ),
            ),
          ),
          buildSizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      onTap: (){
                        Get.to(
                          const ChatScreen(),
                          curve: Curves.easeIn,
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 400),
                        );
                      },
                      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      tileColor: AppColors.greyColor.withOpacity(.5),
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      leading: const CircleAvatar(),
                      title: const CustomTextWidget(
                        text: "Mamun Islam mim",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      subtitle: const CustomTextWidget(
                        text: "Mamun Islam mim xcvz xvd xzdced fbetxcvv  ",
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                      trailing: const CustomTextWidget(
                        text: "12:36",
                      ),
                    ),
                  );
                }),
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
