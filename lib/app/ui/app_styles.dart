import 'package:flutter/material.dart';

import 'app_color_helper.dart';

export 'package:time/time.dart';

class Fonts {
  static const String lato = "Lato";

  static const String quicksand = "Quicksand";
}

class PageBreaks {
  static double get largePhone => 550;

  static double get tabletPortrait => 768;

  static double get tabletLandscape => 1024;

  static double get desktop => 1440;
}

class Insets {
  static const gutterScale = 1.0;

  static const scale = 1.0;

  /// Dynamic insets, may get scaled with the device size
  static double get mGutter => m * gutterScale;

  static double get lGutter => l * gutterScale;

  static double get xs => 2 * scale;

  static double get s => 6 * scale;

  static double get sX => 8 * scale;

  static double get m => 12 * scale;

  static double get mX => 16 * scale;

  static double get l => 24 * scale;

  static double get xl => 36 * scale;

  static double get xxl => 46 * scale;

  static double get defaultPadding => mX;
}

class Sizes {
  static double hitScale = 1;

  static double get inputTextFieldHeight => 34 * hitScale;

  static double get hit => 40 * hitScale;

  static double get sideBarSm => 150 * hitScale;

  static double get sideBarMed => 200 * hitScale;

  static double get sideBarLg => 290 * hitScale;
}

class IconSizes {
  static double hitScale = 1;

  static double get xs => 16 * hitScale;

  static double get s => 18 * hitScale;

  static double get m => 20 * hitScale;

  static double get mX => 24 * hitScale;

  static double get l => 30 * hitScale;
}

class Shadows {
  static bool enabled = true;

  static double get mRadius => 8;

  static List<BoxShadow> m(Color color, {double? opacity = 0}) {
    return enabled
        ? [
            BoxShadow(
              color: color.withOpacity(opacity ?? .03),
              blurRadius: mRadius,
              spreadRadius: mRadius / 2,
              offset: const Offset(1, 0),
            ),
            BoxShadow(
              color: color.withOpacity(opacity ?? .04),
              blurRadius: mRadius / 2,
              spreadRadius: mRadius / 4,
              offset: const Offset(1, 0),
            )
          ]
        : [];
  }
}

class Corners {
  static double get btn => s4;

  static double get dialog => 12;

  static double get s2 => 2;

  static BorderRadius get s2Border => BorderRadius.all(s2Radius);

  static Radius get s2Radius => Radius.circular(s2);

  /// Xs

  static double get s4 => 4;

  static BorderRadius get s4Border => BorderRadius.all(s4Radius);

  static Radius get s4Radius => Radius.circular(s4);

  /// Small

  static double get s6 => 6;

  static BorderRadius get s6Border => BorderRadius.all(s6Radius);

  static Radius get s6Radius => Radius.circular(s6);

  /// Medium
  static double get s8 => 8;

  static BorderRadius get s8Border => BorderRadius.all(s8Radius);

  static Radius get s8Radius => Radius.circular(s8);

  /// Large
  static double get s10 => 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => Radius.circular(s10);

  static double get s12 => 12;

  static BorderRadius get s12Border => BorderRadius.all(s12Radius);

  static Radius get s12Radius => Radius.circular(s12);

  static double get s16 => 16;

  static Radius get s16Radius => Radius.circular(s16);

  static BorderRadius get s16Border => BorderRadius.all(s16Radius);

  static double get s20 => 20;

  static BorderRadius get s20Border => BorderRadius.all(s20Radius);

  static Radius get s20Radius => Radius.circular(s20);

  static double get s30 => 30;

  static BorderRadius get s30Border => BorderRadius.all(s30Radius);

  static Radius get s30Radius => Radius.circular(s30);

  static OutlineInputBorder inputFieldBorder(
          {Color? borderColor, Radius? radius, bool showError = false}) =>
      OutlineInputBorder(
          borderSide: BorderSide(
              color: showError
                  ? AppColorHelper.errorColor
                  : borderColor ?? (AppColorHelper.borderColor)),
          borderRadius: BorderRadius.all(radius ?? Corners.s4Radius));
}
