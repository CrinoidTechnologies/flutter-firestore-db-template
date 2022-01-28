import 'package:flutter/material.dart';

class Images {
  Images._privateConstructor();

  static final Images _instance = Images._privateConstructor();

  static Images get instance {
    return _instance;
  }

  Image banner(
          {double? width,
          double? height,
          Color? color,
          BlendMode? colorBlendMode,
          BoxFit? fit}) =>
      Image(
          image: AssetImage("assets/ic_branding.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
