import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/ui_controller/sign_up.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_button.dart';
import 'package:my_chat/view/common_widget/custom_loading_button.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:my_chat/view/screen/authentication/sign_in/sign_in.dart';
import 'package:my_chat/view/screen/authentication/widget/confirm_password_field.dart';
import 'package:my_chat/view/screen/authentication/widget/email_field.dart';
import 'package:my_chat/view/screen/authentication/widget/name_field.dart';
import 'package:my_chat/view/screen/authentication/widget/password_field.dart';
import 'package:my_chat/view/screen/authentication/widget/phone_field.dart';
import 'package:my_chat/view/screen/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:my_chat/view/screen/chat_list/chat_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.bg1LightColor.withOpacity(.89)),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSizedBox(height: size.height / 15),
                Image.asset(
                  "assets/images/chat.png",
                  height: size.height / 4.5,
                  width: size.width / 1.2,
                  fit: BoxFit.fill,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(color: AppColors.cardLightColor, borderRadius: const BorderRadius.all(Radius.circular(20)), boxShadow: [
                    BoxShadow(offset: const Offset(0, 3), color: AppColors.appbarLightColor.withOpacity(.5), blurRadius: 16),
                  ]),
                  child: Column(
                    children: [
                      const CustomTextWidget(
                        text: "SIGN UP",
                        fontColor: AppColors.bg1LightColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                      buildSizedBox(height: 25),
                      Form(
                        key: signUpController.formKey,
                        child: Column(
                          children: [
                            NameTextField(
                              controller: signUpController.nameController,
                            ),
                            EmailTextField(
                              controller: signUpController.emailController,
                            ),
                            PhoneTextField(
                              controller: signUpController.phoneController,
                            ),
                            PasswordTextField(
                              controller: signUpController,
                              onTap: () {
                                signUpController.isPasswordEnable.value = !signUpController.isPasswordEnable.value;
                              },
                            ),
                            // ConfirmPasswordTextField(
                            //   controller: signUpController,
                            //   password:
                            //       signUpController.passwordController.text,
                            //   onTap: () {
                            //     signUpController.isConfirmPasswordEnable.value =
                            //         !signUpController
                            //             .isConfirmPasswordEnable.value;
                            //   },
                            // )
                          ],
                        ),
                      ),
                      buildSizedBox(height: 25),
                      Obx(() => signUpController.isLoading.value
                          ? const CustomLoadingButton(
                              buttonWidth: 150,
                            )
                          : CustomButton(
                              text: "Sign Up",
                              buttonWidth: 150,
                              onTap: () async {

                                FocusScope.of(context).unfocus();
                                if (!signUpController.formKey.currentState!
                                    .validate()) {
                                  return;
                                }
                                signUpController.isLoading.value = true;
                                bool status = await signUpController.signUpFunction();
                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                if (status) {
                                  prefs.setBool("alreadyLogin", true);
                                  Get.offAll(const ChatList());
                                }
                                // EasyLoading.show();
                                // await Future.delayed(const Duration(seconds: 1));
                                // EasyLoading.showSuccess("Sign Up Successful");
                                // signUpController.isLoading.value = false;
                                // Get.offAll(const ChatList());
                              },
                            )),
                      buildSizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(text: "Already have an account?  "),
                          GestureDetector(
                            onTap: () {
                              Get.off(const SignIn());
                            },
                            child: const CustomTextWidget(
                              text: "Sign IN",
                              fontColor: AppColors.appbarLightColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? 1,
      width: width ?? 1,
    );
  }
}
