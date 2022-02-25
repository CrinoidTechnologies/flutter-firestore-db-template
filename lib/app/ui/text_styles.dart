import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color_helper.dart';

/// TextStyles - All the core text styles for the app should be declared here.
/// Don't try and create every variant in existence here, just the high level ones.
/// More specific variants can be created on the fly using `style.copyWith()`
/// `newStyle = AppTextStyles.body1.copyWith(lineHeight: 2, color: Colors.red)`
class AppTextStyles {
  /// other styles

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
          FontWeight weight = FontWeight.normal,
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

  static TextStyle caption(BuildContext context) =>
      Theme.of(context).textTheme.caption!;

  static TextStyle subTitle1(BuildContext context) =>
      Theme.of(context).textTheme.subtitle1!;

  static TextStyle get body12MediumGreyWeakColor => Get.find<ThemeData>()
      .textTheme
      .bodyText1!
      .copyWith(color: ColorHelper.greyWeakColor, fontSize: 12);

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

  static TextStyle captionBodyDarkColor(BuildContext context) =>
      Theme.of(context)
          .textTheme
          .caption!
          .copyWith(color: ColorHelper.bodyDarkColor);

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

  static TextStyle get text15NormalDarkColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 15,
          color: ColorHelper.darkColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text15NormalDarkOrangeColor =>
      text15NormalDarkColor.copyWith(color: ColorHelper.darkOrangeColor);

  static TextStyle get text15NormalBluishGreyColor =>
      Get.find<ThemeData>().textTheme.bodyText1!.copyWith(
          fontSize: 15,
          color: ColorHelper.bluishGreyColor,
          fontWeight: FontWeight.w400);

  static TextStyle get text15MediumDarkColor => text15NormalDarkColor.copyWith(
      fontWeight: FontWeight.w500, color: ColorHelper.darkColor);
}
