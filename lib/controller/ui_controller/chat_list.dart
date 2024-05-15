import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString userID = "".obs;

  getUserID() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userID.value = prefs.getString("user_id") ?? "";
    log("ID : $userID");
  }

  @override
  void onInit() {
    getUserID();
    super.onInit();
  }
}
