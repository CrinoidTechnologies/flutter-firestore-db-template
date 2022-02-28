import 'package:grocery_template/_shared/di/dependency_injection.dart';
import 'package:logger/logger.dart';

logV(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
    sharedSL<Logger>().v(message, error, stackTrace);

logD(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
    sharedSL<Logger>().d(message, error, stackTrace);

logI(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
    sharedSL<Logger>().i(message, error, stackTrace);

logW(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
    sharedSL<Logger>().w(message, error, stackTrace);

logE(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
    sharedSL<Logger>().e(message, error, stackTrace);
