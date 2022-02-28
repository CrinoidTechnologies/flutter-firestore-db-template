import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/app_styles.dart';

import 'app_color_helper.dart';

class AppDecorations {
  static get defaultCardDecoration => BoxDecoration(
      color: AppColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get menuDecoration =>
      RoundedRectangleBorder(borderRadius: Corners.s10Border);

  static get lightBgDecoration => BoxDecoration(color: AppColorHelper.lightColor);

  static get lightR30BgDecoration => BoxDecoration(
      color: AppColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get borderGreyR16BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border,
      border: Border.all(color: AppColorHelper.borderColor));

  static get borderDarkBgDecoration =>
      BoxDecoration(border: Border.all(color: AppColorHelper.darkColor));

  static datPickerIconBgDecoration({Color? bgColor}) => BoxDecoration(
      color: bgColor ?? AppColorHelper.blueColor.withOpacity(0.1),
      borderRadius: Corners.s12Border);

  static borderDecoration(
          {required double borderRadius, required Color borderColor}) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(color: AppColorHelper.borderColor));

  static MaterialStateProperty<OutlinedBorder?> get buttonShapeR12Decoration =>
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: Corners.s12Border,
      ));
}
