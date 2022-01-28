import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:grocery_template/_core/utils/color_utils.dart';
import 'package:grocery_template/generated/l10n.dart';

enum ThemeType { light, dark }

class AppTheme {
  final ThemeType themType;

  String get name => isDark ? S.current.darkTheme : S.current.lightTheme;

  Color primary;
  Color accent;

  bool isDark;
  Color primaryBg; //
  Color surface; //
  Color primaryLight;
  Color primaryDark;
  Color primaryDarker;
  Color secondary;
  Color grey;
  Color greyStrong;
  Color greyWeak;
  Color? error;
  Color focus;
  Color? accentTxt;
  Color? bluishGrey;

  List<Color> get trialEventTypeColor => [
        darkBlueColor,
        orangeColor,
        darkRedColor,
        darkGreenColor,
      ];

  /// Default constructor
  AppTheme(
    this.themType, {
    required this.isDark,
    required this.primaryBg,
    required this.surface,
    required this.primaryLight,
    required this.primary,
    required this.primaryDark,
    this.accentTxt,
    required this.primaryDarker,
    required this.secondary,
    required this.accent,
    required this.greyWeak,
    required this.focus,
    required this.error,
    required this.grey,
    required this.greyStrong,
    required this.bluishGrey,
  }) {
    accentTxt = accentTxt ?? (isDark ? Colors.black : Colors.white);
  }

  factory AppTheme.light() => AppTheme(
        ThemeType.light,
        isDark: false,
        primaryBg: Color(0xfff7fafc),
        surface: Colors.white,
        primaryLight: Color(0xFFE7BFFF),
        primary: Color(0xff843DAB),
        primaryDark: Color(0xff843DAB),
        primaryDarker: Color(0xff843DAB),
        secondary: Color(0xfff09433),
        accent: Color(0xfff09433),
        greyWeak: Color(0xff909f9c),
        grey: Color(0xff515d5a),
        greyStrong: Color(0xff151918),
        error: Colors.red.shade900,
        focus: Color(0xFF0ee2b1),
        bluishGrey: Color(0xff475F7B),
      );

  factory AppTheme.dark() => AppTheme(
        ThemeType.dark,
        isDark: true,
        primaryBg: Color(0xff595F69),
        surface: Colors.black,
        primaryLight: Color(0xFFE7BFFF),
        primary: Color(0xff843DAB),
        primaryDark: Color(0xff843DAB),
        primaryDarker: Color(0xff843DAB),
        secondary: Color(0xfff09433),
        accent: Color(0xff5bc91a),
        greyWeak: Color(0xff909f9c),
        bluishGrey: Color(0xff475F7B),
        grey: Color(0xff515d5a),
        greyStrong: Color(0xff151918),
        error: Colors.red.shade900,
        focus: Color(0xFF0ee2b1),
      );

  factory AppTheme.fromThemeMode(ThemeMode t) {
    switch (t) {
      case ThemeMode.light:
        return AppTheme.fromType(ThemeType.light);
      case ThemeMode.dark:
        return AppTheme.fromType(ThemeType.dark);
      case ThemeMode.system:
        {
          var brightness = SchedulerBinding.instance!.window.platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;
          return AppTheme.fromType(
              isDarkMode ? ThemeType.dark : ThemeType.light);
        }
    }
  }

  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme.light();
      case ThemeType.dark:
        return AppTheme.dark();
      default:
        return AppTheme.light();
    }
  }

  ThemeData get themeData {
    var t = isDark ? ThemeData.dark() : ThemeData.light();
    //Add fields here which you want to apply to Theme.of(context) based on theme type
    return t.copyWith(
        colorScheme: ColorScheme.fromSwatch(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primarySwatch: Colors.purple,
      accentColor: accent,
    ));
  }

  Color get onBoardingScreenBg => Color(0xFF121212);

  Color get fixedLightColor => Colors.white;

  Color get fixedDarkColor => Colors.black;

  Color get lightColor => isDark ? Color(0xFF18191A) : Colors.white;

  Color get lightBgColor => isDark ? Color(0xFF595F69) : Colors.white;

  Color get darkColor => isDark ? Colors.white : Colors.black;

  Color get txt => isDark ? Colors.white : Colors.black;

  Color get formBgColor => isDark ? Color(0xFF595F69) : Color(0xFFF8F8F8);

  Color get darkBlueColor => Color(0xFF009EB3);

  Color get darkRedColor => Color(0xFFF05C54);

  Color get darkYellowColor => Color(0xFFE6B823);

  Color get darkOrangeColor => Color(0xFFE56E19);

  Color get darkGreenColor => Color(0xFF20A144);

  Color get greenColor => Color(0xFF49C96D);

  Color get blueColor => Color(0xFF22CCE2);

  Color get yellowColor => Color(0xFFFFD240);

  Color get redColor => Color(0xFFFD7972);

  Color get orangeColor => Color(0xFFFF965D);

  Color get boxColor => Color(0xFF304FFD);

  Color get headingColor => isDark ? Colors.white : Color(0xFF3F434A);

  Color get bodyLightColor => Color(0xFF8A9099);

  Color get bluishGreyColor => isDark ? Colors.white : Color(0xff475F7B);

  Color get bodyDarkColor => isDark ? Color(0xFFE8E9EB) : Color(0xFF595F69);

  Color get greyColor => Color(0xFFC6C9CC);

  Color get lightGreyColor => Color(0xFFE8E9EB);

  Color get darkGreyColor => Color(0xFF727E8C);

  Color get borderColor => isDark ? Color(0xFF8A9099) : Color(0xFFE8E9EB);

  Color get secondaryBtnBgColor =>
      isDark ? Color(0xFF3F434A) : Color(0xFFE8E9EB);

  Color get selectedItemBgColor =>
      isDark ? Color(0xFF3F434A) : Color(0xFFE8E9EB);

  Color get dashboardBgColor => isDark ? Color(0xFF3F434A) : Color(0xFFE5E5E5);

  Color get browseBtnColor => Color(0xFFF0F4F7);

  Color shift(Color c, double d) =>
      CoreColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));
}
