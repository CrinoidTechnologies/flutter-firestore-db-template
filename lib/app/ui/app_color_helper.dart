import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/ui/app_themes.dart';

class AppColorHelper {
  static Color get accentColor => Get.find<AppTheme>().accent;

  static Color get primaryColor => Get.find<AppTheme>().primary;

  static Color get primaryDarkColor => Get.find<AppTheme>().primaryDark;

  static Color get primaryBgColor => Get.find<AppTheme>().primaryBg;

  static Color get primaryTextColor => Get.find<AppTheme>().txt;

  static Color get primaryLightColor => Get.find<AppTheme>().primaryLight;

  /// fixed white Color
  static Color get fixedLightColor => Get.find<AppTheme>().fixedLightColor;

  /// fixed dark Color
  static Color get fixedDarkColor => Get.find<AppTheme>().fixedDarkColor;

  /// black color
  static Color get darkColor => Get.find<AppTheme>().darkColor;

  /// white color
  static Color get lightColor => Get.find<AppTheme>().lightColor;

  static Color get lightBgColor => Get.find<AppTheme>().lightBgColor;

  static Color get blueColor => Get.find<AppTheme>().boxColor;

  static Color get darkOrangeColor => Get.find<AppTheme>().darkOrangeColor;

  static Color get greyColor => Get.find<AppTheme>().greyColor;

  static Color get greyWeakColor => Get.find<AppTheme>().greyWeak;

  static Color get bluishGreyColor => Get.find<AppTheme>().bluishGreyColor;

  static Color get borderColor => Get.find<AppTheme>().borderColor;

  static Color get selectedItemBgColor =>
      Get.find<AppTheme>().selectedItemBgColor;

  static Color get dashboardCardTitleColor =>
      Get.find<AppTheme>().bodyDarkColor;

  static Color get rowActionIconColor => Get.find<AppTheme>().bodyLightColor;

  static Color get bodyDarkColor => Get.find<AppTheme>().bodyDarkColor;

  static Color get paginationItemBorderColor =>
      Get.find<AppTheme>().borderColor;

  static Color get participantFormDarkOrangeColor =>
      Get.find<AppTheme>().darkOrangeColor;

  static Color get participantFormBackBtnColor =>
      Get.find<AppTheme>().greyColor;

  static Color get errorTextColor => Get.find<AppTheme>().redColor;

  static Color get successTextColor => Get.find<AppTheme>().greenColor;

  static Color get greenColor => Get.find<AppTheme>().greenColor;

  static Color get saveIconColor => Get.find<AppTheme>().greenColor;

  static Color get bodyLightColor => Get.find<AppTheme>().bodyLightColor;

  static Color get headingColor => Get.find<AppTheme>().headingColor;

  static Color get errorColor =>
      Get.find<AppTheme>().error ?? Get.find<AppTheme>().darkRedColor;
}
