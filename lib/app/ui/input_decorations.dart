import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/app/ui/text_styles.dart';

class AppInputDecorations {
  static InputDecoration defaultInputDecoration =
      const InputDecoration(border: OutlineInputBorder(), isDense: true);

  static InputDecoration formInputFieldDecoration(
      {String? hintText, Widget? prefixIcon, bool showError = false}) {
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
