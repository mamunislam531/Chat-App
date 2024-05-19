import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/ui_controller/chat_screen.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_appbar.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:my_chat/view/screen/chat_screen/controller/message_sent.dart';
import 'package:my_chat/view/screen/chat_screen/widget/bottom_sheet.dart';
import 'package:my_chat/view/screen/chat_screen/widget/message_field.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.receiverID, required this.senderID, required this.receiverName});
  final String receiverID;
  final String senderID;
  final String receiverName;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String myDocID = "0";
  int counter = 0;

  void getDocumentNames() async {
    await FirebaseFirestore.instance.collection('chat').get().then((QuerySnapshot querySnapshot) {
      log('------Document ID: ${querySnapshot.docs}');
      for (var doc in querySnapshot.docs) {
        String documentId = doc.id;
        log('------Document ID: $documentId');
        if (documentId.contains(widget.receiverID)) {
          log("______ Found : $documentId");
          myDocID = documentId.toString();
          setState(() {});
        }
      }
    });
  }

  @override
  void initState() {
    getDocumentNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChatScreenController controller = Get.put(ChatScreenController());
    if (myDocID == "0") {
      myDocID = "${widget.senderID}_${widget.receiverID}";
    }
    return Scaffold(
      appBar: CustomAppBar(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                buildSizedBox(weight: 10),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      NetworkImage("https://static.vecteezy.com/system/resources/previews/011/459/666/original/people-avatar-icon-png.png"),
                ),
                buildSizedBox(weight: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: widget.receiverName,
                      fontColor: Colors.white,
                      fontSize: 20,
                    ),
                    const CustomTextWidget(
                      text: "last message at 2:35 PM",
                      fontColor: AppColors.greyColor,
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    getDocumentNames();
                  },
                  child: const Icon(
                    Icons.more_vert_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          )),
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.green, image: DecorationImage(image: AssetImage("assets/images/whats.jpg"), fit: BoxFit.fill, opacity: .8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chat")
                      .doc(myDocID)
                      .collection("collectionPath")
                      .orderBy("dateTime", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    var data = snapshot.data?.docs;
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: const EdgeInsets.all(5),
                          reverse: true,
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            if (data[index]["id"].toString() == widget.senderID) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Expanded(flex: 1, child: SizedBox()),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        buildSizedBox(weight: 5),
                                        Expanded(
                                          child: Card(
                                            shape: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(2),
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft: Radius.circular(10),
                                                  bottomRight: Radius.circular(10),
                                                )),
                                            child: "${data[index]['message_type']}" == "image"
                                                ? FadeInImage.assetNetwork(
                                                    height: 50,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                    placeholder: "assets/images/no_image.png",
                                                    image: "${data[index]['message_type']}",
                                                    imageErrorBuilder: (context, o, t) {
                                                      return Image.asset(
                                                        "assets/images/no_image.png",
                                                        fit: BoxFit.fill,
                                                        height: 100,
                                                        width: 120,
                                                      );
                                                    },
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: CustomTextWidget(
                                                      text: "${data[index]['message']}",
                                                      fontColor: Colors.white,
                                                      fontSize: 15,
                                                      maxLine: 300,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: AppColors.appbarLightColor,
                                          backgroundImage: AssetImage("assets/images/im.jpeg"),
                                        ),
                                        buildSizedBox(weight: 5),
                                        Expanded(
                                          child: Card(
                                            color: Colors.white.withOpacity(.9),
                                            shape: const OutlineInputBorder(
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
                                                text: "${data[index]['message']}",
                                                fontColor: Colors.black,
                                                fontSize: 15,
                                                maxLine: 300,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Expanded(flex: 1, child: SizedBox())
                                ],
                              );
                            }
                            // return Row(
                            //   mainAxisAlignment: data[index]["id"].toString() == id.toString() ? MainAxisAlignment.start : MainAxisAlignment.end,
                            //   children: [
                            //     Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         const CircleAvatar(
                            //           radius: 15,
                            //           backgroundColor: AppColors.appbarLightColor,
                            //           backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/106102340?v=4"),
                            //         ),
                            //         buildSizedBox(weight: 5),
                            //         Card(
                            //           shape: const OutlineInputBorder(
                            //               borderSide: BorderSide.none,
                            //               borderRadius: BorderRadius.only(
                            //                 topRight: Radius.circular(10),
                            //                 topLeft: Radius.circular(2),
                            //                 bottomLeft: Radius.circular(10),
                            //                 bottomRight: Radius.circular(10),
                            //               )),
                            //           child: Padding(
                            //             padding: const EdgeInsets.all(8.0),
                            //             child: CustomTextWidget(
                            //               text: "${data[index]['message']}",
                            //               fontColor: Colors.black54,
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.w400,
                            //             ),
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ],
                            // );
                          });
                    } else {
                      return const Text("No data");
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            // isScrollControlled: true,
                            context: context,
                            builder: (builder) {
                              return MyBottomSheet(
                                controller: controller,
                                myDocID: myDocID,
                                senderID: widget.senderID,
                              );
                            });
                      },
                      child: const Icon(
                        Icons.more_vert_sharp,
                        color: Colors.white,
                        size: 30,
                      )),
                  Expanded(
                    child: MessageField(
                      messageController: controller.messageController,
                    ),
                  ),
                  // ChatBoxController(linkTap: (){}, cameraTap: (){}),
                  InkWell(
                    onTap: () async {
                      log("======================  widget.myID   ${widget.senderID}  ==============================");
                      await MessageSentService.messageSentService(
                          message: controller.messageController.text, docID: myDocID, senderID: widget.senderID, messageType: 'text');
                      controller.messageController.clear();
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.appbarLightColor,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
