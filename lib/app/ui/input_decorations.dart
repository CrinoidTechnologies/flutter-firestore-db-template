import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';
import 'color_helper.dart';


class AppInputDecorations {
  static InputDecoration defaultInputDecoration =
      InputDecoration(border: OutlineInputBorder(), isDense: true);

  static InputDecoration getLoginTextInputDecoration(
      {Widget? suffixIcon, Widget? prefixIcon, String hintText: ""}) {
    return InputDecoration(
      border: Corners.inputFieldBorder(
        borderColor: ColorHelper.darkColor,
        radius: Corners.s14Radius,
      ),
      // disabledBorder: Corners.inputFieldBorder(),
      // enabledBorder: Corners.inputFieldBorder(),
      // focusedBorder: Corners.inputFieldBorder(),
      // border: Corners.inputFieldBorder(),
      isDense: true,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
    );
  }

  static InputDecoration formInputFieldDecoration(
      {String? hintText, Widget? prefixIcon, bool showError: false}) {
    return InputDecoration(
        isDense: true,
        hintText: hintText ?? "",
        prefixIcon: prefixIcon,
        contentPadding:
            EdgeInsets.symmetric(vertical: Insets.mX, horizontal: Insets.m),
        hintStyle: AppTextStyles.text14NormalGreyColor,
        disabledBorder: Corners.inputFieldBorder(showError: showError),
        enabledBorder: Corners.inputFieldBorder(showError: showError),
        border: Corners.inputFieldBorder(showError: showError),
        focusedBorder: Corners.inputFieldBorder(showError: showError));
  }
}
