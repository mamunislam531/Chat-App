import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_chat/utils/common_function/common_snackbar_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInService {
  static Future<bool> signInService({required String email, required String password}) async {
    try {
      var collectionData = await FirebaseFirestore.instance.collection("User").get();
      for (var i in collectionData.docs) {
        if (i['email'] == email && i['password'] == password) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("user_id", i['id']);
          await prefs.setBool("alreadyLogin", true);
          await EasyLoading.showSuccess("Login Success");
          return true;
        }
      }
    } catch (e) {
      log("Error : $e");
    }
    CommonSnackBarMessage.errorMessage(text: "Wrong User");
    return false;
  }
}
