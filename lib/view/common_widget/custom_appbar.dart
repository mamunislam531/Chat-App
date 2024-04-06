import 'package:flutter/material.dart';
import 'package:my_chat/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double? height;
  const CustomAppBar({
    super.key,
    this.height,
    required this.child,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? 90);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 5),
      height: preferredSize.height,
      color: AppColors.bg1LightColor,
      alignment: Alignment.bottomCenter,
      child: child,
    );
  }
}
