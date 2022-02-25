import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';
import 'package:grocery_template/generated/l10n.dart';
import 'package:intl/intl.dart';

class LanguageController extends GetxController {
  final isProcessing = false.obs;
  final currentLanguage = ''.obs;

  void changeLocale(String _localeString) async {
    Locale _locale = Locale(_localeString);
    isProcessing.value = true;
    await S.load(_locale);
    Get.updateLocale(_locale);
    isProcessing.value = false;
    currentLanguage.value = Intl.getCurrentLocale().replaceAll('_', '-');
    logD(
        'changeLocale $_localeString, currentLanguage ${currentLanguage.value}');
    refresh();
  }

  ///Contains all the supported language codes (en, es, ...)
  final supportedLanguage = <Locale>[].obs;

  @override
  void onInit() {
    super.onInit();
    supportedLanguage.value =
        S.delegate.supportedLocales.toList(growable: false);
    currentLanguage.value = Intl.getCurrentLocale().replaceAll('_', '-');
    logD(' currentLanguage ${currentLanguage.value}');
  }

  int indexOfSupportedLanguages(String? languageCode) {
    if (languageCode == null) return -1;
    return supportedLanguage
        .indexWhere((element) => element.languageCode == languageCode);
  }
}
