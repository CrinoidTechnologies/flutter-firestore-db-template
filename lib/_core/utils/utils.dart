import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';

class CoreUtils {
  static void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static bool get isMouseConnected =>
      RendererBinding.instance?.mouseTracker.mouseIsConnected ?? false;

  static void unFocus() {
    WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
  }

  static void benchmark(String name, void Function() test) {
    int ms = DateTime.now().millisecondsSinceEpoch;
    test();
    logD("Benchmark: $name == ${DateTime.now().millisecondsSinceEpoch - ms}ms");
  }
}
