import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/ui/routes/app_pages.dart';

class SplashController extends GetxController {
  SplashController();

  get _pathParameters =>
      Get.parameters.map((key, value) => MapEntry(key, value ?? ''));

  @override
  void onReady() {
    _moveToNext(delay: const Duration(milliseconds: 3000));
  }

  _moveToNext({Duration? delay}) async {
    if (kDebugMode) {
      print('_moveToNext $delay');
    }
    final allFutures = <Future>[];
    if (delay != null) {
      allFutures.add(Future.delayed(delay, () => const Right(null)));
    }
    Get.offAllNamed(Routes.dashboard, parameters: _pathParameters);
  }
}
