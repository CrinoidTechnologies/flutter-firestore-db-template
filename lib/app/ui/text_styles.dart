import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/ui/themes.dart';

import 'color_helper.dart';

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = AppTextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class AppTextStyles {
  /// other styles

  // static const TextStyle lato = TextStyle(
  //   fontFamily: Fonts.lato,
  //   fontWeight: FontWeight.w400,
  //   letterSpacing: 0,
  //   height: 1,
  //   fontFamilyFallback: [
  //     Fonts.emoji,
  //   ],
  // );
  //
  // static const TextStyle quicksand = TextStyle(
  //   fontFamily: Fonts.quicksand,
  //   fontWeight: FontWeight.w400,
  //   fontFamilyFallback: [
  //     Fonts.emoji,
  //   ],
  // );
  //

  static TextStyle headline4Style(BuildContext context,
          {Color? color, FontWeight? weight, double letterSpacing = 0}) =>
      Get.find<ThemeData>().textTheme.headline4!.copyWith(
          color: color ?? Theme.of(context).textTheme.headline4!.color,
          fontWeight:
              weight ?? Theme.of(context).textTheme.headline4!.fontWeight,
          letterSpacing: letterSpacing);

  static TextStyle headline5Style(BuildContext context,
          {Color? color, FontWeight? weight, double letterSpacing = 0}) =>
      Get.find<ThemeData>().textTheme.headline5!.copyWith(
          color: color ?? Theme.of(context).textTheme.headline5!.color,
          fontWeight:
              weight ?? Theme.of(context).textTheme.headline5!.fontWeight,
          letterSpacing: letterSpacing);

  static TextStyle subTitle1Style(BuildContext context,
          {Color? color,
          FontWeight weight: FontWeight.normal,
          double letterSpacing = 0}) =>
      Theme.of(context).textTheme.subtitle1!.copyWith(
          color: color ?? Theme.of(context).textTheme.subtitle1!.color,
          fontWeight: weight,
          letterSpacing: letterSpacing);

  static TextStyle bodyText2Style(BuildContext context,
          {Color? color,
          FontWeight? weight,
          double letterSpacing = 0,
          double? fontSize}) =>
      Theme.of(context).textTheme.bodyText2!.copyWith(
          color: color ?? Theme.of(context).textTheme.bodyText2!.color,
          fontWeight:
              weight ?? Theme.of(context).textTheme.bodyText2!.fontWeight,
          letterSpacing: letterSpacing,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyText2!.fontSize);

  static TextStyle bodyText1Style(BuildContext context,
          {Color? color,
          FontWeight? weight,
          double letterSpacing = 0,
          double? fontSize}) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
          color: color ?? Theme.of(context).textTheme.bodyText1!.color,
          fontWeight:
              weight ?? Theme.of(context).textTheme.bodyText1!.fontWeight,
          letterSpacing: letterSpacing,
          fontSize:
              fontSize ?? Theme.of(context).textTheme.bodyText1!.fontSize);

  static TextStyle captionStyle(BuildContext context,
          {Color? color,
          FontWeight? weight,
          double letterSpacing = 0,
          double? fontSize}) =>
      Theme.of(context).textTheme.caption!.copyWith(
          color: color ?? Theme.of(context).textTheme.caption!.color,
          fontWeight: weight ?? Theme.of(context).textTheme.caption!.fontWeight,
          letterSpacing: letterSpacing,
          fontSize: fontSize ?? Theme.of(context).textTheme.caption!.fontSize);

  static TextStyle get body15MediumLightColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.bodyLightColor);

  static TextStyle get body12MediumHeadingColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.headingColor, fontSize: 12);

  static TextStyle get body12MediumGreyWeakColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.greyWeakColor, fontSize: 12);

  static TextStyle get headline4MediumDarkColor => Get.find<ThemeData>()
      .textTheme
      .headline4!
      .copyWith(color: ColorHelper.darkColor, fontWeight: FontWeight.w500);

  static TextStyle get headline6LightColor => Get.find<ThemeData>()
      .textTheme
      .headline6!
      .copyWith(color: ColorHelper.lightColor);

  static TextStyle get headline6BodyDarkColor => Get.find<ThemeData>()
      .textTheme
      .headline6!
      .copyWith(color: ColorHelper.bodyDarkColor);

  static TextStyle get headline6DarkColor => Get.find<ThemeData>()
      .textTheme
      .headline6!
      .copyWith(color: ColorHelper.darkColor);

  static TextStyle get headline4DarkColor => Get.find<ThemeData>()
      .textTheme
      .headline4!
      .copyWith(color: ColorHelper.darkColor);

  static TextStyle get bodyText1DarkColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.darkColor);

  static TextStyle get bodyText2BodyLightColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.bodyLightColor);

  static TextStyle get bodyText2LightColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.lightColor);

  static TextStyle get bodyText2BodyDarkColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.bodyDarkColor);

  static TextStyle get bodyText2BodyDarkColor12 => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.bodyDarkColor, fontSize: 12);

  static TextStyle get bodyText2MediumAccentColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.accentColor, fontWeight: FontWeight.w500);

  static TextStyle get bodyText2MediumBlue =>
      Get.find<ThemeData>().textTheme.bodyText2!.copyWith(
          color: ColorHelper.dashboardBlueBoxColor,
          fontWeight: FontWeight.w500);

  static TextStyle get bodyText2PrimaryColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.primaryColor);

  static TextStyle get bodyText2DarkOrangeColor => Get.find<ThemeData>()
      .textTheme
      .bodyText2!
      .copyWith(color: ColorHelper.darkOrangeColor);

  static TextStyle get bodyText1LightColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.lightColor);

  static TextStyle get captionBodyLightColor => Get.find<ThemeData>()
      .textTheme
      .caption!
      .copyWith(color: ColorHelper.bodyLightColor);

  static TextStyle get captionGreenColor => Get.find<ThemeData>()
      .textTheme
      .caption!
      .copyWith(color: ColorHelper.successTextColor);

  static TextStyle get captionDarkRedColor => Get.find<ThemeData>()
      .textTheme
      .caption!
      .copyWith(color: ColorHelper.darkRedColor);

  static TextStyle bodyText1(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith();

  static TextStyle bodyText1Medium(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(fontWeight: FontWeight.w500);

  static TextStyle bodyText1MediumLightColor(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.w500, color: ColorHelper.bodyLightColor);

  static TextStyle bodyText2(BuildContext context) =>
      Theme.of(context).textTheme.bodyText2!.copyWith();

  static TextStyle caption12(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(fontSize: 12);

  static TextStyle caption12BodyLight(BuildContext context) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: ColorHelper.bodyLightColor, fontSize: 12);

  static TextStyle caption14Accent(BuildContext context) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: ColorHelper.accentColor, fontSize: 14);

  static TextStyle caption14(BuildContext context) =>
      Theme.of(context).textTheme.caption!.copyWith(fontSize: 14);

  static TextStyle captionBodyDarkColor(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: ColorHelper.bodyDarkColor);

  static TextStyle caption(BuildContext context) =>
      Theme.of(context).textTheme.caption!;

  static TextStyle subTitle1(BuildContext context) =>
      Theme.of(context).textTheme.subtitle1!;

  static TextStyle get bodyRegular14HeadingColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 14,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text14NormalDarkColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 14,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text14NormalGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 14,
          color: ColorHelper.greyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text12NormalGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 12,
          color: ColorHelper.greyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text12NormalDarkColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 12,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text12NormalBluishGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 12,
          color: ColorHelper.bluishGreyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text15NormalDarkColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 15,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text15NormalPrimaryColor =>
      text15NormalDarkColor.copyWith(color: ColorHelper.primaryColor);

  static TextStyle get text15NormalGreyColor =>
      text15NormalDarkColor.copyWith(color: ColorHelper.greyColor);

  static TextStyle get text15NormalGreyWeakColor =>
      text15NormalDarkColor.copyWith(color: ColorHelper.greyWeakColor);

  static TextStyle get text15NormalDarkOrangeColor =>
      text15NormalDarkColor.copyWith(color: ColorHelper.darkOrangeColor);

  static TextStyle get text15NormalBluishGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 15,
          color: ColorHelper.bluishGreyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text15MediumBluishGreyColor =>
      text15NormalBluishGreyColor.copyWith(fontWeight: FontWeight.w500);

  static TextStyle get text15MediumDarkColor => text15NormalDarkColor.copyWith(
      fontWeight: FontWeight.w500, color: ColorHelper.darkColor);

  static TextStyle get text15MediumDarkOrangeColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 15,
          color: ColorHelper.darkOrangeColor,
          fontWeight: FontWeight.w500);

  static TextStyle get text18NormalDarkColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 18,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text18NormalBluishGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 18,
          color: ColorHelper.bluishGreyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text18NormalPrimaryColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 18,
          color: ColorHelper.primaryDarkColor,
          fontWeight: FontWeight.w400);

  // TODO: Add or Remove this styles after design is ideal for dark and light theme
  static TextStyle get bodyText1FixedLightColor => Get.find<AppTheme>().isDark
      ? AppTextStyles.bodyText1DarkColor
      : AppTextStyles.bodyText1LightColor;

  static TextStyle get bodyText2FixedLightColor => Get.find<AppTheme>().isDark
      ? AppTextStyles.bodyText1DarkColor
      : AppTextStyles.bodyText1LightColor;

  static TextStyle get forgotPasswordLabelStyle => Get.find<AppTheme>().isDark
      ? AppTextStyles.bodyText2BodyDarkColor
      : AppTextStyles.bodyText2PrimaryColor;

// static TextStyle get t1 => quicksand.bold.size(FontSizes.s14).letterSpace(.7);
//
//
// static TextStyle get h1 => lato.bold.size(FontSizes.s14);
//
//
// static TextStyle get body1 => lato.size(FontSizes.s14);
//
// static TextStyle get body2 => lato.size(FontSizes.s12);
//
//
// static TextStyle get callout =>
//     quicksand.size(FontSizes.s14).letterSpace(1.75);
//
// static TextStyle get calloutFocus => callout.bold;
//
// static TextStyle get button =>
//     quicksand.bold.size(FontSizes.s14).letterSpace(1.75);
//
// static TextStyle get buttonSelected =>
//     quicksand.size(FontSizes.s14).letterSpace(1.75);
//

//
// /// other styles
// static TextStyle get textFieldLabel => lato.bold
//     .textColor(Colors.grey.shade700)
//     .size(FontSizes.s14)
//     .letterSpace(.3);
}
