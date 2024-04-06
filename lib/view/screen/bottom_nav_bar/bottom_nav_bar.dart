
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_chat/controller/ui_controller/bottom_nav_bar.dart';
import 'package:my_chat/utils/app_colors.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController bottomNavBarController = Get.put(BottomNavBarController());
    return Scaffold(
      body: Obx(() => bottomNavBarController.screensList[bottomNavBarController.page.value]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          color: AppColors.bg1LightColor,
          height: 60,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeIn,
          animationDuration: const Duration(milliseconds: 300),
          index: bottomNavBarController.page.value,
          key: bottomNavBarController.bottomNavigationKey,
          items: <Widget>[
            buildIcon(iconData: Icons.grid_view),
            buildIcon(iconData: Icons.add_shopping_cart_outlined),
            buildIcon(iconData: Icons.home_outlined),
            buildIcon(iconData: Icons.favorite_border),
            buildIcon(iconData: Icons.account_circle_sharp),
          ],
          onTap: (index) {
            bottomNavBarController.page.value = index;
          },
        ),
      ),
    );
  }


  // Custom Icon
  Icon buildIcon({required IconData iconData}) {
    return Icon(iconData, size: 30, color: Colors.white);
  }
}
