import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "AppBar": "AppBar",
          "all_sales": "All Sales",
          "language_change": "Language Change",
          "theme_change": "Theme Change",
        },
        "bn_BD": {
          "AppBar": "অ্যাপবার",
          "all_sales": "সমস্ত বিক্রয়",
          "language_change": "ভাষা পরিবর্তন",
          "theme_change": "থিম পরিবর্তন",
        },
      };
}
