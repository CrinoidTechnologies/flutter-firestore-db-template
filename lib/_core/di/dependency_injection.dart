import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

/// Global instance, use it to get any dependency
final coreSL = GetIt.instance;

/// initialize all core dependency here
Future<void> initCoreServiceLocator() async {
  coreSL.registerLazySingleton(() => Connectivity());
}
