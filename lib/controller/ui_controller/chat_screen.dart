import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_chat/view/screen/chat_screen/controller/message_sent.dart';

class ChatScreenController extends GetxController {
  TextEditingController messageController = TextEditingController();
  XFile? image;

  Future<void> imagePicker() async {
    ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    log("Image Path : $image");
  }

  String? imageUrl;
  Future<void> setImages({required String myDocID,required String senderID,}) async {
    await EasyLoading.show(status: "Uploading Image");
    var snapshot = await FirebaseStorage.instance.ref("Student_Image").child("ss").putFile(File(image!.path));
    imageUrl = await snapshot.ref.getDownloadURL();
    await MessageSentService.messageSentService(
        message: imageUrl!, docID: myDocID, senderID: senderID, messageType: 'image');
    log("Image Url : $imageUrl");
    Get.back();
    await EasyLoading.showSuccess("Done");
  }
}
