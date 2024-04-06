
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  RxInt page = 2.obs;
  List<Widget> screensList = [

  ];
}
