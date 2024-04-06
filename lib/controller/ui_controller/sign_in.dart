

import 'package:flutter/material.dart';
import 'package:get/get.dart';


// Login Controller
class SignInController extends GetxController{
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isPasswordEnable = false.obs;
  RxBool isLoading = false.obs;


}