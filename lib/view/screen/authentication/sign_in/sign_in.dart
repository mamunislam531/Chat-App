import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/ui_controller/sign_in.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/common_widget/custom_button.dart';
import 'package:my_chat/view/common_widget/custom_loading_button.dart';
import 'package:my_chat/view/common_widget/custom_text.dart';
import 'package:my_chat/view/screen/authentication/widget/email_field.dart';
import 'package:my_chat/view/screen/authentication/widget/password_field.dart';
import 'package:my_chat/view/screen/chat_list/chat_list.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    SignInController signInController = Get.put(SignInController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.sizeOf(context).width,
                  color: AppColors.bg1LightColor.withOpacity(.89)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSizedBox(height: size.height / 6),
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
                    decoration: BoxDecoration(
                      color: AppColors.cardLightColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(offset: const Offset(0, 3), color: AppColors.appbarLightColor.withOpacity(.5), blurRadius: 16),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomTextWidget(
                          text: "SIGN IN",
                          fontColor: AppColors.bg1LightColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 35,
                        ),
                        buildSizedBox(),
                        Form(
                          key: signInController.formKey,
                          child: Column(
                            children: [
                              EmailTextField(controller: signInController.emailController),
                              PasswordTextField(
                                controller: signInController,
                                onTap: () {
                                  signInController.isPasswordEnable.value = !signInController.isPasswordEnable.value;
                                },
                              )
                            ],
                          ),
                        ),
                        buildSizedBox(height: 15),

                        Obx(() => signInController.isLoading.value
                            ? const CustomLoadingButton(
                                buttonWidth: 150,
                              )
                            : CustomButton(
                                text: "Sign In",
                                buttonWidth: 150,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (!signInController.formKey.currentState!.validate()) {
                                    return;
                                  }
                                  bool status = await signInController.signInService();
                                  if (status) {

                                    Get.offAll(() => const ChatList());
                                  }
                                },
                              )),

                        buildSizedBox(height: 10),

                        /// Don't have an account ? sign in
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomTextWidget(text: "Don't have an account?  "),
                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(signupScreenRoute);
                              },
                              child: const CustomTextWidget(
                                text: "Sign Up",
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
