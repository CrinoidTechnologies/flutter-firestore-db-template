import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_shared/di/dependency_injection.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';
import 'package:grocery_template/_shared/utils/storage_util.dart';
import 'package:grocery_template/_shared/utils/toast_util.dart';
import 'package:grocery_template/app/ui/app_themes.dart';
import 'package:grocery_template/app/utils/app_storage_util.dart';


const themeIndicatorIcons = [
  Icons.brightness_auto_sharp,
  Icons.light_mode,
  Icons.dark_mode,
];

class ThemeController extends GetxController {
  final currentThemeMode = Rx<ThemeMode?>(null);

  @override
  void onInit() {
    super.onInit();
    var window = SchedulerBinding.instance!.window;
    window.onPlatformBrightnessChanged = () {
      // This callback is called every time the brightness changes by device settings.
      var brightness = window.platformBrightness;
      if (currentThemeMode.value == ThemeMode.system) {
        setThemeMode(ThemeMode.system, showMessage: true);
      }
    };
    //Set initial theme from last saved in preferences or default which is light
    setThemeMode(getThemeModeFromPreferences() ?? ThemeMode.system);
  }

  ///Switch between available themes
  toggleTheme() {
    var newTheme = ThemeMode.values[
        ((currentThemeMode.value?.index ?? 0) + 1) % ThemeMode.values.length];
    setThemeMode(newTheme, showMessage: true);
  }

  //TODO : when changing language, the text colors are not setting properly.. maybe due to the ThemeData not being set properly in GET
  void setThemeMode(ThemeMode themeMode, {bool showMessage = false}) {
    var theme = AppTheme.fromThemeMode(themeMode);
    logD(
        'Current theme : $currentThemeMode \nNew theme : $themeMode ${theme.themType}');
    //If we don't delete the old instance, the new will not be added
    Get.delete<AppTheme>(force: true);
    Get.put(theme, permanent: true);

    Get.changeThemeMode(themeMode);
    currentThemeMode.value = themeMode;
    update();
    var prefs = sharedSL<StorageUtil>();
    prefs.write(
        AppStorageUtil.theme, currentThemeMode.toString().split('.')[1]);
    if (showMessage) {
      showToast(
          Success(
              message: 'Using'
                  ' ${theme.name}${themeMode == ThemeMode.system ? ' (System)' : ''}'),
          length: Toast.LENGTH_LONG);
    }
  }

  ThemeMode? getThemeModeFromPreferences() {
    ThemeMode? themeMode;
    String? themeText =
        sharedSL<StorageUtil>().readString(AppStorageUtil.theme);
    try {
      themeMode =
          ThemeMode.values.firstWhere((e) => describeEnum(e) == themeText);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    return themeMode;
  }

  ///This function is use to set the theme data with appropriate topography to the GET.
  ///This must be called from didChangeDependencies of the screen in which theme is being changed
  setThemeData(BuildContext context) async {
    // await Future.delayed(Duration(milliseconds: 50));
    Get.delete<ThemeData>(force: true);
    Get.put(Theme.of(context), permanent: true);
  }
}
