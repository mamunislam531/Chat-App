import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';

class CustomLoadingButton extends StatelessWidget {
  const CustomLoadingButton({
    super.key,
    this.buttonWidth,
  });
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      color: AppColors.bg1LightColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SizedBox(
          height: 30,
          width: buttonWidth ?? MediaQuery.sizeOf(context).width / 1.2,
          child: const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: AppColors.bg1LightColor,
            ),
          ),
        ),
      ),
    );
  }
}
