import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_template/_core/controllers/app_version_controller.dart';

final coreSL = GetIt.instance;

Future<void> initCoreServiceLocator() async {
  coreSL.registerLazySingleton(() => Connectivity());
  coreSL.registerSingleton(AppVersionController());
}
