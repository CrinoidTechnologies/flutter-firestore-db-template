import 'package:flutter/material.dart';
import 'package:grocery_template/app/ui/styles.dart';
import 'package:grocery_template/generated/l10n.dart';

import 'app_tooltip.dart';
import 'bg_decoration.dart';
import 'color_helper.dart';

Widget clickableIconButton(IconData icon,
        {Color? color,
        double size = 24,
        VoidCallback? onPress,
        String? toolTip,
        EdgeInsetsGeometry padding = const EdgeInsets.all(8.0)}) =>
    IconButton(
      icon: iconWidget(icon, size: size, color: color ?? ColorHelper.darkColor),
      iconSize: size,
      padding: padding,
      tooltip: toolTip,
      onPressed: () {
        if (onPress != null) onPress();
      },
    );

Widget clickableIcon(
  IconData icon, {
  Color? color,
  double size = 24,
  VoidCallback? onPress,
  EdgeInsets? padding,
}) =>
    InkWell(
      onTap: () {
        if (onPress != null) onPress();
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: iconWidget(
          icon,
          color: color ?? ColorHelper.darkColor,
          size: size,
        ),
      ),
    );

Widget closePageButton(VoidCallback? onPress) =>
    clickableToolTipIcon(Icons.close,
        onPress: onPress, toolTip: S.current.close);

Widget clickableToolTipIcon(IconData icon,
        {Color? color,
        double size = 24,
        VoidCallback? onPress,
        EdgeInsets? padding,
        required String toolTip}) =>
    AppToolTip(
      message: toolTip,
      child: InkWell(
        onTap: () {
          if (onPress != null) onPress();
        },
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: iconWidget(
            icon,
            color: color ?? ColorHelper.darkColor,
            size: size,
          ),
        ),
      ),
    );

Widget clickableToolTipWidget(Widget widget,
        {VoidCallback? onPress,
        EdgeInsets? padding,
        required String toolTip}) =>
    AppToolTip(
      message: toolTip,
      child: InkWell(
        onTap: () {
          if (onPress != null) onPress();
        },
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: widget,
        ),
      ),
    );

Icon iconWidget(IconData icon, {Color? color, double size = 24}) {
  return Icon(
    icon,
    color: color ?? ColorHelper.darkColor,
    size: size,
  );
}

Widget datePickerIconWidget(
    {required bool isCompactView,
    required double datPickerIconSize,
    Color? bgColor,
    Color? iconColor}) {
  return Container(
    height: isCompactView ? Insets.mX : datPickerIconSize,
    width: isCompactView ? Insets.mX : datPickerIconSize,
    decoration: AppDecorations.datPickerIconBgDecoration(bgColor: bgColor),
    child: iconWidget(
      Icons.calendar_today,
      color: iconColor ?? ColorHelper.blueColor,
      size: isCompactView ? Insets.sX : Insets.mX,
    ),
  );
}
