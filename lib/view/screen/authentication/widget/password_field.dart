import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/utils/app_colors.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final dynamic controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: controller.passwordController,
          obscureText: controller.isPasswordEnable.value,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "********",
            errorStyle: const TextStyle(fontSize: 12),
            suffixIcon: controller.isPasswordEnable.value
                ? InkWell(onTap: onTap, child: const Icon(Icons.remove_red_eye,color: AppColors.bg1LightColor,))
                : InkWell(
                    onTap: onTap,
                    child: const Icon(Icons.remove_red_eye_outlined,color: AppColors.bg1LightColor,),
                  ),
          ),
          validator: (value) {
            if (value == null || value == '') {
              return "Please Insert your password";
            }else if (value.toString().length < 6) {
              return "Password at lest 6 digit";
            }
            return null;
          },
        ));
  }
}
