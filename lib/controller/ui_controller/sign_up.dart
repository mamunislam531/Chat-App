

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Create An Account Controller
class SignUpController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordEnable = false.obs;
  RxBool isConfirmPasswordEnable = false.obs;
  RxBool isLoading = false.obs;
}