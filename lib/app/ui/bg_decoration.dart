import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/styles.dart';

import 'color_helper.dart';


class AppDecorations {
  static dashboardTopBarDecoration(Color color) => BoxDecoration(
      color: ColorHelper.dashboardAddIconColor.withOpacity(0.1),
      borderRadius: Corners.s12Border,
      border: Border.all(color: color));

  static get menuDecoration =>
      RoundedRectangleBorder(borderRadius: Corners.s10Border);

  static get defaultR30BgDecoration => BoxDecoration(
      color: ColorHelper.primaryBgColor, borderRadius: Corners.s30Border);

  static get participantFormBgDecoration => BoxDecoration(
      color: ColorHelper.participantFormBgColor,
      borderRadius: Corners.s30Border);

  static get lightBgDecoration => BoxDecoration(color: ColorHelper.lightColor);

  static get lightR30BgDecoration => BoxDecoration(
      color: ColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get defaultCardDecoration => BoxDecoration(
      color: ColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get greyR4BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border, color: ColorHelper.greyColor);

  static get borderColorR4BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border, color: ColorHelper.borderColor);

  static get secondaryBtnBgColorR4BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border, color: ColorHelper.secondaryBtnBgColor);

  static get greyR20BgDecoration => BoxDecoration(
      borderRadius: Corners.s20Border, color: ColorHelper.greyColor);

  static get primaryR10BgDecoration => BoxDecoration(
      borderRadius: Corners.s10Border, color: ColorHelper.primaryBgColor);

  static get paginationSelectedItemColorR8BgDecoration => BoxDecoration(
      color: ColorHelper.paginationSelectedItemColor,
      borderRadius: Corners.s8Border);

  static get borderGreyR4LightBgDecoration => BoxDecoration(
      color: ColorHelper.lightColor,
      borderRadius: Corners.s4Border,
      border: Border.all(color: ColorHelper.borderColor));

  static get borderGreyR16BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border,
      border: Border.all(color: ColorHelper.borderColor));

  static get borderDarkBgDecoration =>
      BoxDecoration(border: Border.all(color: ColorHelper.darkColor));

  static get borderDarkR2BgDecoration => BoxDecoration(
      border: Border.all(color: ColorHelper.darkColor),
      borderRadius: Corners.s2Border);

  static datPickerIconBgDecoration({Color? bgColor}) => BoxDecoration(
      color: bgColor ?? ColorHelper.blueColor.withOpacity(0.1),
      borderRadius: Corners.s14Border);

  static borderDecoration(
          {required double borderRadius, required Color borderColor}) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(color: ColorHelper.borderColor));

  static MaterialStateProperty<OutlinedBorder?> get buttonShapeR12Decoration =>
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: Corners.s12Border,
      ));

  static get browseBtnDecoration => BoxDecoration(
      color: ColorHelper.browseBtnColor,
      borderRadius: Corners.s4Border,
      border: Border.all(color: ColorHelper.borderColor));

  static get tbFieldAddWidgetDecoration => BoxDecoration(
      borderRadius: Corners.s10Border,
      color: ColorHelper.tbFieldAddWidgetColor);
}
