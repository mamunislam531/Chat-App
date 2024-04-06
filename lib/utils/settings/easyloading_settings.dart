import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_chat/utils/app_colors.dart';


/// Setting Color, theme in Easyloading
class EasyloadingSettings {
  easyloadingSetting() {
    EasyLoading.instance
      ..displayDuration = const Duration(seconds: 2)
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = AppColors.bg1LightColor
      ..indicatorColor = AppColors.bgLightColor
      ..maskColor = AppColors.bg1LightColor
      ..textColor = AppColors.bgLightColor
      ..contentPadding = const EdgeInsets.symmetric(horizontal: 50, vertical: 20)
      ..indicatorType = EasyLoadingIndicatorType.fadingGrid
      ..userInteractions = false
      ..successWidget = const Icon(Icons.check_circle_rounded,color: Colors.white,size: 40,)
      ..errorWidget = const Icon(Icons.error_outline,color: Colors.white,size: 30,)
      ..dismissOnTap = false;
  }
}
