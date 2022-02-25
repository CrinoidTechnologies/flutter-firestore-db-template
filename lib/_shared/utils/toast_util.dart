import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:grocery_template/_core/status.dart';
import 'package:grocery_template/_shared/utils/logger_utils.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:intl/intl.dart';

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

void showMessage(Status value) {
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

  if (message?.isNotEmpty ?? false) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        isDismissible: true,
        backgroundColor: bg,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }
}
