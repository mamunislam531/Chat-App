import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/utils/app_colors.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.onTap,
    required this.password,
  });

  final dynamic controller;
  final VoidCallback onTap;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          controller: controller.confirmPasswordController,
          obscureText: controller.isConfirmPasswordEnable.value,
          decoration: InputDecoration(
            labelText: "Confirm password",
            hintText: "********",
            errorStyle: const TextStyle(fontSize: 12),
            suffixIcon: controller.isConfirmPasswordEnable.value
                ? InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.remove_red_eye,
                      color: AppColors.bg1LightColor,
                    ))
                : InkWell(
                    onTap: onTap,
                    child: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.bg1LightColor,
                    ),
                  ),
          ),
          validator: (value) {
            if (value == null || value == '') {
              return "Please Insert your password";
            } else if (value.toString() != password) {
              return "Password & confirm password doesn't match";
            }
            return null;
          },
        ));
  }
}
