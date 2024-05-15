import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/firebase/firebase_service.dart';
import 'package:my_chat/model/user.dart';

// Create An Account Controller
class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordEnable = false.obs;
  RxBool isConfirmPasswordEnable = false.obs;
  RxBool isLoading = false.obs;

  Future<bool> signUpFunction() async {
    UserModels userModels = UserModels(
        name: nameController.text,
        id: phoneController.text,
        email: emailController.text,
        phone: phoneController.text,
        token: "token",
        password: passwordController.text);
    await EasyLoading.show();
    var status = await FirebaseService.createAccount(userModels: userModels);
    await EasyLoading.showSuccess("Successful");
    return status;
  }
}
