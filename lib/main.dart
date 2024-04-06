import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_chat/utils/localization.dart';
import 'package:my_chat/utils/settings/easyloading_settings.dart';
import 'package:my_chat/utils/theme/light_theme.dart';
import 'package:my_chat/view/screen/authentication/sign_in/sign_in.dart';
import 'package:my_chat/view/screen/chat_list/chat_list.dart';
import 'package:my_chat/view/screen/chat_screen/chat_screen.dart';
import 'package:my_chat/view/screen/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  EasyloadingSettings().easyloadingSetting();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
        (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: LightThemes.light,
      translations: Localization(),
      locale: const Locale("en", "US"),
      home: const SplashScreen(),
    );
  }
}
