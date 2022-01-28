import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/ui/themes.dart';


class ColorHelper {
  static Color get accentColor => Get.find<AppTheme>().accent;

  static Color get primaryLightColor => Get.find<AppTheme>().primaryLight;

  static Color get primaryColor => Get.find<AppTheme>().primary;

  static Color get primaryDarkColor => Get.find<AppTheme>().primaryDark;

  static Color get primaryBgColor => Get.find<AppTheme>().primaryBg;

  static Color get primaryTextColor => Get.find<AppTheme>().txt;

  /// fixed white Color
  static Color get fixedLightColor => Get.find<AppTheme>().fixedLightColor;

  /// fixed dark Color
  static Color get fixedDarkColor => Get.find<AppTheme>().fixedDarkColor;

  /// black color
  static Color get darkColor => Get.find<AppTheme>().darkColor;

  /// white color
  static Color get lightColor => Get.find<AppTheme>().lightColor;

  static Color get lightBgColor => Get.find<AppTheme>().lightBgColor;

  @deprecated
  static Color get offWhiteColor => Color(0xB3d3d3d3);

  static Color get onBoardingScreenBg =>
      Get.find<AppTheme>().onBoardingScreenBg;

  /// blue color shades
  static Color get blueColor => Get.find<AppTheme>().boxColor;

  static Color get darkBlueColor => Get.find<AppTheme>().darkBlueColor;

  static Color get darkRedColor => Get.find<AppTheme>().darkRedColor;

  static Color get darkOrangeColor => Get.find<AppTheme>().darkOrangeColor;

  /// grey color shades
  static Color get greyColor => Get.find<AppTheme>().greyColor;

  static Color get greyWeakColor => Get.find<AppTheme>().greyWeak;

  static Color get darkGreyColor => Get.find<AppTheme>().darkGreyColor;

  static Color get bluishGreyColor => Get.find<AppTheme>().bluishGreyColor;

  static Color get browseBtnColor => Get.find<AppTheme>().browseBtnColor;

  //TODO need to define these color in App Theme
  static Color get loginBgColor => Get.find<AppTheme>().primary;

  static Color get dashboardProgressBgColor => Get.find<AppTheme>().borderColor;

  static Color get dashboardBgColor => Get.find<AppTheme>().dashboardBgColor;

  static Color get participantFormBgColor => Get.find<AppTheme>().formBgColor;

  static Color get borderColor => Get.find<AppTheme>().borderColor;

  static Color get selectedItemBgColor => Get.find<AppTheme>().selectedItemBgColor;

  static Color get secondaryBtnBgColor => Get.find<AppTheme>().secondaryBtnBgColor;

  static Color get txtColorBody1 => Get.find<AppTheme>().bodyLightColor;

  static Color get txtColorMenuText => Get.find<AppTheme>().headingColor;

  static Color get inputTextBorderColor => Get.find<AppTheme>().borderColor;

  static Color get dashboardCardTextColor =>
      Get.find<AppTheme>().bodyLightColor;

  static Color get dashboardCardTitleColor =>
      Get.find<AppTheme>().bodyDarkColor;

  static Color get participantRowTextColor =>
      Get.find<AppTheme>().bodyDarkColor;

  static Color get dashboardAddIconColor => Get.find<AppTheme>().primary;

  static Color get dashboardEditIconColor => Get.find<AppTheme>().darkBlueColor;

  static Color get rowActionIconColor => Get.find<AppTheme>().bodyLightColor;

  static Color get bodyDarkColor => Get.find<AppTheme>().bodyDarkColor;

  static Color get paginationSelectedItemColor => Get.find<AppTheme>().boxColor;

  static Color get participantRowSelectedColor =>
      Get.find<AppTheme>().primaryBg;

  static Color get selectedFolderColor => Get.find<AppTheme>().primaryBg;

  static Color get dashboardBlueBoxColor => Get.find<AppTheme>().boxColor;

  static Color get dashboardProgressFilledColor =>
      Get.find<AppTheme>().greenColor;

  static Color get paginationItemBorderColor =>
      Get.find<AppTheme>().borderColor;

  static Color get defaultTrialScheme => Get.find<AppTheme>().boxColor;

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

  //TODO : Add these colors to app theme for dark and light theme
  static Color get auditLogRowSelectedColor => Get.find<AppTheme>().isDark
      ? ColorHelper.primaryColor
      : ColorHelper.primaryLightColor;

  static Color get tbFieldAddWidgetColor => Get.find<AppTheme>().isDark
      ? ColorHelper.dashboardBgColor
      : ColorHelper.primaryBgColor;
}
