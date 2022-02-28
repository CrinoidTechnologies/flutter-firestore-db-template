import 'package:flutter/material.dart';

class AppImages {
  AppImages._privateConstructor();

  static final AppImages _instance = AppImages._privateConstructor();

  static AppImages get instance {
    return _instance;
  }

  Image banner(
          {double? width,
          double? height,
          Color? color,
          BlendMode? colorBlendMode,
          BoxFit? fit}) =>
      Image(
          image: const AssetImage("assets/ic_branding.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
