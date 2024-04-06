import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/utils/app_colors.dart';
import 'package:my_chat/view/screen/authentication/sign_in/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    logoAnimationController();
  }

  logoAnimationController() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.01, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeInBack,
      ),
    );
    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(const SignIn());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaleTransition(
        filterQuality: FilterQuality.medium,
        scale: _animation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/chat.png',
                height: 350,
                width: 300,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: AppColors.appbarLightColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
