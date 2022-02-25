import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

final coreSL = GetIt.instance;

Future<void> initCoreServiceLocator() async {
  coreSL.registerLazySingleton(() => Connectivity());
}
