import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_shared/utils/logger_utls.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:intl/intl.dart';
import '../status.dart';

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
    print(
        "Benchmark: $name == ${DateTime.now().millisecondsSinceEpoch - ms}ms");
  }
}

void showToast(Status value, {Toast length = Toast.LENGTH_SHORT}) {
  String? message;

  message = value.messageId != null
      ? Intl.message(
          value.messageId ?? '',
          name: value.messageId ?? '',
          desc: '',
          args: [],
        )
      : value.message ?? "";

  //TODO set background color based on theme (for web also)
  Fluttertoast.showToast(
    msg: message,
    toastLength: length,
    gravity: ToastGravity.TOP,
    webPosition: "center",
    timeInSecForIosWeb: length == Toast.LENGTH_SHORT ? 1 : 5,
    fontSize: 16.0,
    backgroundColor: ColorHelper.primaryBgColor,
    textColor: ColorHelper.primaryTextColor,
  );
}

showMessage(Status value) {
  String? message;
  Color bg = Colors.green;

  if (value is Failure) {
    bg = Colors.red;
    message = value.messageId != null
        ? Intl.message(
            value.messageId ?? '',
            name: value.messageId ?? '',
            desc: '',
            args: [],
          )
        : value.message ?? "";
    if (kDebugMode) {
      logE(value);
    }
  } else if (value is Success) {
    message = value.messageId != null
        ? Intl.message(
            value.messageId ?? '',
            name: value.messageId ?? '',
            desc: '',
            args: [],
          )
        : value.message ?? "";
  }

  if (message?.isNotEmpty ?? false)
    Get.showSnackbar(
      GetBar(
        message: message,
        isDismissible: true,
        backgroundColor: bg,
        duration: const Duration(milliseconds: 2000),
      ),
    );
}
