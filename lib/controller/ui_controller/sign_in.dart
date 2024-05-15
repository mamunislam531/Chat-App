
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/firebase/firebase_service/sign_in.dart';

// Login Controller
class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordEnable = false.obs;
  RxBool isLoading = false.obs;

  Future<bool> signInService() async {
    isLoading.value = true;
    bool status = await SignInService.signInService(email: emailController.text, password: passwordController.text);
    isLoading.value = false;
    return status;
  }
}
