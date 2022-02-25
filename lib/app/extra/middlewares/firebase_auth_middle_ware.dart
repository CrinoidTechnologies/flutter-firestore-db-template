// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FirebaseAuthMiddleWare extends GetMiddleware {
//   final LoginStatusUseCase _loginStatusUseCase;
//
//   FirebaseAuthMiddleWare(this._loginStatusUseCase);
//
//   @override
//   RouteSettings? redirect(String? route) {
//     final result = _loginStatusUseCase(0).fold(
//         (l) => RouteSettings(name: AppPages.redirectHome),
//         (r) => r == null ? RouteSettings(name: AppPages.redirectHome) : null);
//     // debugPrint('redirect check to $route $result');
//     return result;
//   }
// }
