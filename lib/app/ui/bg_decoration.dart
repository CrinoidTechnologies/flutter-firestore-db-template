import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/styles.dart';

import 'color_helper.dart';

class AppDecorations {
  static get defaultCardDecoration => BoxDecoration(
      color: ColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get menuDecoration =>
      RoundedRectangleBorder(borderRadius: Corners.s10Border);

  static get lightBgDecoration => BoxDecoration(color: ColorHelper.lightColor);

  static get lightR30BgDecoration => BoxDecoration(
      color: ColorHelper.lightColor, borderRadius: Corners.s30Border);

  static get borderGreyR16BgDecoration => BoxDecoration(
      borderRadius: Corners.s4Border,
      border: Border.all(color: ColorHelper.borderColor));

  static get borderDarkBgDecoration =>
      BoxDecoration(border: Border.all(color: ColorHelper.darkColor));

  static datPickerIconBgDecoration({Color? bgColor}) => BoxDecoration(
      color: bgColor ?? ColorHelper.blueColor.withOpacity(0.1),
      borderRadius: Corners.s12Border);

  static borderDecoration(
          {required double borderRadius, required Color borderColor}) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          border: Border.all(color: ColorHelper.borderColor));

  static MaterialStateProperty<OutlinedBorder?> get buttonShapeR12Decoration =>
      MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
        borderRadius: Corners.s12Border,
      ));
}
