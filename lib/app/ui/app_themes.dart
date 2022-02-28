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
        primaryBg: const Color(0xfff7fafc),
        surface: Colors.white,
        primaryLight: const Color(0xFFE7BFFF),
        primary: const Color(0xff843DAB),
        primaryDark: const Color(0xff843DAB),
        primaryDarker: const Color(0xff843DAB),
        secondary: const Color(0xfff09433),
        accent: const Color(0xfff09433),
        greyWeak: const Color(0xff909f9c),
        grey: const Color(0xff515d5a),
        greyStrong: const Color(0xff151918),
        error: Colors.red.shade900,
        focus: const Color(0xFF0ee2b1),
        bluishGrey: const Color(0xff475F7B),
      );

  factory AppTheme.dark() => AppTheme(
        ThemeType.dark,
        isDark: true,
        primaryBg: const Color(0xff595F69),
        surface: Colors.black,
        primaryLight: const Color(0xFFE7BFFF),
        primary: const Color(0xff843DAB),
        primaryDark: const Color(0xff843DAB),
        primaryDarker: const Color(0xff843DAB),
        secondary: const Color(0xfff09433),
        accent: const Color(0xff5bc91a),
        greyWeak: const Color(0xff909f9c),
        bluishGrey: const Color(0xff475F7B),
        grey: const Color(0xff515d5a),
        greyStrong: const Color(0xff151918),
        error: Colors.red.shade900,
        focus: const Color(0xFF0ee2b1),
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

  Color get onBoardingScreenBg => const Color(0xFF121212);

  Color get fixedLightColor => Colors.white;

  Color get fixedDarkColor => Colors.black;

  Color get lightColor => isDark ? const Color(0xFF18191A) : Colors.white;

  Color get lightBgColor => isDark ? const Color(0xFF595F69) : Colors.white;

  Color get darkColor => isDark ? Colors.white : Colors.black;

  Color get txt => isDark ? Colors.white : Colors.black;

  Color get formBgColor =>
      isDark ? const Color(0xFF595F69) : const Color(0xFFF8F8F8);

  Color get darkBlueColor => const Color(0xFF009EB3);

  Color get darkRedColor => const Color(0xFFF05C54);

  Color get darkYellowColor => const Color(0xFFE6B823);

  Color get darkOrangeColor => const Color(0xFFE56E19);

  Color get darkGreenColor => const Color(0xFF20A144);

  Color get greenColor => const Color(0xFF49C96D);

  Color get blueColor => const Color(0xFF22CCE2);

  Color get yellowColor => const Color(0xFFFFD240);

  Color get redColor => const Color(0xFFFD7972);

  Color get orangeColor => const Color(0xFFFF965D);

  Color get boxColor => const Color(0xFF304FFD);

  Color get headingColor => isDark ? Colors.white : const Color(0xFF3F434A);

  Color get bodyLightColor => const Color(0xFF8A9099);

  Color get bluishGreyColor => isDark ? Colors.white : const Color(0xff475F7B);

  Color get bodyDarkColor =>
      isDark ? const Color(0xFFE8E9EB) : const Color(0xFF595F69);

  Color get greyColor => const Color(0xFFC6C9CC);

  Color get darkGreyColor => const Color(0xFF727E8C);

  Color get borderColor =>
      isDark ? const Color(0xFF8A9099) : const Color(0xFFE8E9EB);

  Color get secondaryBtnBgColor =>
      isDark ? const Color(0xFF3F434A) : const Color(0xFFE8E9EB);

  Color get selectedItemBgColor =>
      isDark ? const Color(0xFF3F434A) : const Color(0xFFE8E9EB);

  Color get dashboardBgColor =>
      isDark ? const Color(0xFF3F434A) : const Color(0xFFE5E5E5);

  Color get browseBtnColor => const Color(0xFFF0F4F7);

  Color shift(Color c, double d) =>
      CoreColorUtils.shiftHsl(c, d * (isDark ? -1 : 1));
}
